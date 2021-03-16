//
// VS_Faderbox
// 4 Fader Midi Controller
//
// Please reuse as much as you please, as I did creating this in the first place.
// This was originally written for the Teensy LC using tttapa's Control Surface Library
// https://github.com/tttapa/Control-Surface
// 
// nativeVS - 2021
//

//
// SysEx Specification:
//
// Channel and Fader Reassignment SysEx Format:
// F0 [id] [id] [id] [dI] [s1] [s2] [cc] [f0] [f1] [f2] [f3] xx F7
// with manufacturer ID (00 21 57), device id (01) and sub ids #1 & #2 (model number [02], version number [04] respectively);
// checksum includes manufacturer id
//
// Responds to SysEx ID Requests:
// F0 7E 01 06 01 F7 (device id 01) or
// F0 7E 7F 06 01 F7 (ignore device id 7F)
// SysEx Reply:
// F0 7E 01 06 02 [id] [id] [id] 01 01 00 02 00 00 00 04 F7
//                               |   | |   | |---------- Software Version No: v4
//                               |   | |---- Model Number: 00 02 (Teensy version)
//                               |---- Family Code: 01 01 (USB MIDI Controller)
//
// when reusing any of this source code please refrain from using my SysEx Manufacturer ID;
// please make sure to use the non-commercial ID (0x7D) or your own instead.
//

#include <Control_Surface.h>
#include <EEPROM.h>

USBMIDI_Interface midi;

constexpr byte deviceID{ 0x01 };
constexpr byte modelNumber[2]{ 0x00, 0x02 };
constexpr byte softwareVersion[4]{ 0x00, 0x00, 0x00, 0x04 };
constexpr byte manufacturerID[3]{ 0x00, 0x21, 0x57 };

constexpr int sysExLength{ 14 };
constexpr int dataStart{ 7 };

constexpr byte defaultSysEx[sysExLength]{ 0xf0,             //Start of SysEx
  manufacturerID[0], manufacturerID[1], manufacturerID[2],  //Manufacturer ID
  deviceID, modelNumber[1], softwareVersion[3],             //Device & Sub IDs
  0x01, 0x01, 0x0b, 0x15, 0x14,                             //Start of Data: Default Channel & Fader assignment
  0x4a, 0xf7};                                              //Checksum and end of SysEx


byte MIDIchannel = EEPROM.read(0);

byte ccno_fader_0 = EEPROM.read(1);
byte ccno_fader_1 = EEPROM.read(2);
byte ccno_fader_2 = EEPROM.read(3);
byte ccno_fader_3 = EEPROM.read(4);

byte sysexIDreply[17]{0xf0, 0x7e, 0x01, 0x06, 0x02,         //Start of SysEx ID Reply as defined by MMA
  manufacturerID[0], manufacturerID[1], manufacturerID[2],  //Manufacturer ID
  0x01, 0x01,                                               //Family Code
  modelNumber[0], modelNumber[1],                           //Model Number
  softwareVersion[0], softwareVersion[1],
  softwareVersion[2], softwareVersion[3],                   //Software Version
  0xf7};                                                    //end of SysEx ID Reply



class AddressablePot : public Bankable::MIDIFilteredAnalog<Bankable::SingleAddressMultipleBanks<2>, ContinuousCCSender> {
  public:
    AddressablePot(const Array<OutputBankableMIDIAddress, 2> &banks, pin_t pin, MIDIAddress address)
        : Bankable::MIDIFilteredAnalog<Bankable::SingleAddressMultipleBanks<2>, ContinuousCCSender>({banks, address}, pin, {}) {}
};

Bank<16> channelBank(1);
Bank<128> addressBank_0(1);
Bank<128> addressBank_1(1);
Bank<128> addressBank_2(1);
Bank<128> addressBank_3(1);

AddressablePot faders[] = {
  {{{{channelBank, BankType::CHANGE_CHANNEL}, {addressBank_0, BankType::CHANGE_ADDRESS}}}, A0, {0x00, CHANNEL_1}},
  {{{{channelBank, BankType::CHANGE_CHANNEL}, {addressBank_1, BankType::CHANGE_ADDRESS}}}, A1, {0x00, CHANNEL_1}},
  {{{{channelBank, BankType::CHANGE_CHANNEL}, {addressBank_2, BankType::CHANGE_ADDRESS}}}, A2, {0x00, CHANNEL_1}},
  {{{{channelBank, BankType::CHANGE_CHANNEL}, {addressBank_3, BankType::CHANGE_ADDRESS}}}, A3, {0x00, CHANNEL_1}},
};

void readfromEEPROM(){
  
  MIDIchannel = EEPROM.read(0);
  channelBank.select(MIDIchannel - 1);

  ccno_fader_0 = EEPROM.read(1);
  ccno_fader_1 = EEPROM.read(2);
  ccno_fader_2 = EEPROM.read(3);
  ccno_fader_3 = EEPROM.read(4);
  addressBank_0.select(ccno_fader_0);
  addressBank_1.select(ccno_fader_1);
  addressBank_2.select(ccno_fader_2);
  addressBank_3.select(ccno_fader_3);
}

struct incomingSysEx : MIDI_Callbacks {
  public:
    void onSysExMessage(Parsing_MIDI_Interface &midi) override {
      SysExMessage sysex = midi.getSysExMessage();
      if (sysex.data[0] == 0xf0 // channel and fader reassignment message
      && sysex.data[1] == defaultSysEx[1] && sysex.data[2] == defaultSysEx[2] && sysex.data[3] == defaultSysEx[3] // Manufacturer ID
      && sysex.data[5] == defaultSysEx[5] && sysex.data[6] == defaultSysEx[6] // sub IDs
      && sysex.data[13] == 0xf7){
        byte checksm = sysex.data[12];
        for (int i=1; i<12; i++){
          checksm += sysex.data[i];
        }
        if (checksm == 0xff){
          for (int i = dataStart; i < (sysExLength - 2); i++){
             EEPROM.write(i - dataStart, sysex.data[i]);
           }
          readfromEEPROM(); // update midi assignments
          // Blink LED when ready
          digitalWrite(13, HIGH);
          delay(500);
          digitalWrite(13, LOW);
        }
      }
      else if (sysex.data[0] == 0xf0 // ID Request
      && sysex.data[1] == 0x7e && sysex.data[2] == (0x7f || deviceID)
      && sysex.data[3] == 0x06 && sysex.data[4] == 0x01
      && sysex.data[5] == 0xf7){
        midi.send(sysexIDreply);
      }
    }
} callback = {};

void setup() {
  pinMode(13, OUTPUT); //LED
  
  Control_Surface.begin();

  midi.begin();
  midi.setCallbacks(callback);

  readfromEEPROM();

  //Blink LED when ready
  digitalWrite(13, HIGH);
  delay(1000);
  digitalWrite(13, LOW);
}

void loop() {
  Control_Surface.loop();

  midi.update();
}
