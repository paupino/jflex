%%

%unicode 3.0
%public
%class UnicodeCaseless_3_0

%type int
%caseless
%standalone

%{
  void print(int codePoint) {
    System.out.format("input char %04X matches %04X case-insensitively%n",
                      (int)yycharat(0), codePoint);
  }
%}

%%

<<EOF>> { return 1; }
"\u0041" { print(0x0041); }
"\u0042" { print(0x0042); }
"\u0043" { print(0x0043); }
"\u0044" { print(0x0044); }
"\u0045" { print(0x0045); }
"\u0046" { print(0x0046); }
"\u0047" { print(0x0047); }
"\u0048" { print(0x0048); }
"\u0049" { print(0x0049); }
"\u004A" { print(0x004A); }
"\u004B" { print(0x004B); }
"\u004C" { print(0x004C); }
"\u004D" { print(0x004D); }
"\u004E" { print(0x004E); }
"\u004F" { print(0x004F); }
"\u0050" { print(0x0050); }
"\u0051" { print(0x0051); }
"\u0052" { print(0x0052); }
"\u0053" { print(0x0053); }
"\u0054" { print(0x0054); }
"\u0055" { print(0x0055); }
"\u0056" { print(0x0056); }
"\u0057" { print(0x0057); }
"\u0058" { print(0x0058); }
"\u0059" { print(0x0059); }
"\u005A" { print(0x005A); }
"\u0061" { print(0x0061); }
"\u0062" { print(0x0062); }
"\u0063" { print(0x0063); }
"\u0064" { print(0x0064); }
"\u0065" { print(0x0065); }
"\u0066" { print(0x0066); }
"\u0067" { print(0x0067); }
"\u0068" { print(0x0068); }
"\u0069" { print(0x0069); }
"\u006A" { print(0x006A); }
"\u006B" { print(0x006B); }
"\u006C" { print(0x006C); }
"\u006D" { print(0x006D); }
"\u006E" { print(0x006E); }
"\u006F" { print(0x006F); }
"\u0070" { print(0x0070); }
"\u0071" { print(0x0071); }
"\u0072" { print(0x0072); }
"\u0073" { print(0x0073); }
"\u0074" { print(0x0074); }
"\u0075" { print(0x0075); }
"\u0076" { print(0x0076); }
"\u0077" { print(0x0077); }
"\u0078" { print(0x0078); }
"\u0079" { print(0x0079); }
"\u007A" { print(0x007A); }
"\u00B5" { print(0x00B5); }
"\u00C0" { print(0x00C0); }
"\u00C1" { print(0x00C1); }
"\u00C2" { print(0x00C2); }
"\u00C3" { print(0x00C3); }
"\u00C4" { print(0x00C4); }
"\u00C5" { print(0x00C5); }
"\u00C6" { print(0x00C6); }
"\u00C7" { print(0x00C7); }
"\u00C8" { print(0x00C8); }
"\u00C9" { print(0x00C9); }
"\u00CA" { print(0x00CA); }
"\u00CB" { print(0x00CB); }
"\u00CC" { print(0x00CC); }
"\u00CD" { print(0x00CD); }
"\u00CE" { print(0x00CE); }
"\u00CF" { print(0x00CF); }
"\u00D0" { print(0x00D0); }
"\u00D1" { print(0x00D1); }
"\u00D2" { print(0x00D2); }
"\u00D3" { print(0x00D3); }
"\u00D4" { print(0x00D4); }
"\u00D5" { print(0x00D5); }
"\u00D6" { print(0x00D6); }
"\u00D8" { print(0x00D8); }
"\u00D9" { print(0x00D9); }
"\u00DA" { print(0x00DA); }
"\u00DB" { print(0x00DB); }
"\u00DC" { print(0x00DC); }
"\u00DD" { print(0x00DD); }
"\u00DE" { print(0x00DE); }
"\u00E0" { print(0x00E0); }
"\u00E1" { print(0x00E1); }
"\u00E2" { print(0x00E2); }
"\u00E3" { print(0x00E3); }
"\u00E4" { print(0x00E4); }
"\u00E5" { print(0x00E5); }
"\u00E6" { print(0x00E6); }
"\u00E7" { print(0x00E7); }
"\u00E8" { print(0x00E8); }
"\u00E9" { print(0x00E9); }
"\u00EA" { print(0x00EA); }
"\u00EB" { print(0x00EB); }
"\u00EC" { print(0x00EC); }
"\u00ED" { print(0x00ED); }
"\u00EE" { print(0x00EE); }
"\u00EF" { print(0x00EF); }
"\u00F0" { print(0x00F0); }
"\u00F1" { print(0x00F1); }
"\u00F2" { print(0x00F2); }
"\u00F3" { print(0x00F3); }
"\u00F4" { print(0x00F4); }
"\u00F5" { print(0x00F5); }
"\u00F6" { print(0x00F6); }
"\u00F8" { print(0x00F8); }
"\u00F9" { print(0x00F9); }
"\u00FA" { print(0x00FA); }
"\u00FB" { print(0x00FB); }
"\u00FC" { print(0x00FC); }
"\u00FD" { print(0x00FD); }
"\u00FE" { print(0x00FE); }
"\u00FF" { print(0x00FF); }
"\u0100" { print(0x0100); }
"\u0101" { print(0x0101); }
"\u0102" { print(0x0102); }
"\u0103" { print(0x0103); }
"\u0104" { print(0x0104); }
"\u0105" { print(0x0105); }
"\u0106" { print(0x0106); }
"\u0107" { print(0x0107); }
"\u0108" { print(0x0108); }
"\u0109" { print(0x0109); }
"\u010A" { print(0x010A); }
"\u010B" { print(0x010B); }
"\u010C" { print(0x010C); }
"\u010D" { print(0x010D); }
"\u010E" { print(0x010E); }
"\u010F" { print(0x010F); }
"\u0110" { print(0x0110); }
"\u0111" { print(0x0111); }
"\u0112" { print(0x0112); }
"\u0113" { print(0x0113); }
"\u0114" { print(0x0114); }
"\u0115" { print(0x0115); }
"\u0116" { print(0x0116); }
"\u0117" { print(0x0117); }
"\u0118" { print(0x0118); }
"\u0119" { print(0x0119); }
"\u011A" { print(0x011A); }
"\u011B" { print(0x011B); }
"\u011C" { print(0x011C); }
"\u011D" { print(0x011D); }
"\u011E" { print(0x011E); }
"\u011F" { print(0x011F); }
"\u0120" { print(0x0120); }
"\u0121" { print(0x0121); }
"\u0122" { print(0x0122); }
"\u0123" { print(0x0123); }
"\u0124" { print(0x0124); }
"\u0125" { print(0x0125); }
"\u0126" { print(0x0126); }
"\u0127" { print(0x0127); }
"\u0128" { print(0x0128); }
"\u0129" { print(0x0129); }
"\u012A" { print(0x012A); }
"\u012B" { print(0x012B); }
"\u012C" { print(0x012C); }
"\u012D" { print(0x012D); }
"\u012E" { print(0x012E); }
"\u012F" { print(0x012F); }
"\u0130" { print(0x0130); }
"\u0131" { print(0x0131); }
"\u0132" { print(0x0132); }
"\u0133" { print(0x0133); }
"\u0134" { print(0x0134); }
"\u0135" { print(0x0135); }
"\u0136" { print(0x0136); }
"\u0137" { print(0x0137); }
"\u0139" { print(0x0139); }
"\u013A" { print(0x013A); }
"\u013B" { print(0x013B); }
"\u013C" { print(0x013C); }
"\u013D" { print(0x013D); }
"\u013E" { print(0x013E); }
"\u013F" { print(0x013F); }
"\u0140" { print(0x0140); }
"\u0141" { print(0x0141); }
"\u0142" { print(0x0142); }
"\u0143" { print(0x0143); }
"\u0144" { print(0x0144); }
"\u0145" { print(0x0145); }
"\u0146" { print(0x0146); }
"\u0147" { print(0x0147); }
"\u0148" { print(0x0148); }
"\u014A" { print(0x014A); }
"\u014B" { print(0x014B); }
"\u014C" { print(0x014C); }
"\u014D" { print(0x014D); }
"\u014E" { print(0x014E); }
"\u014F" { print(0x014F); }
"\u0150" { print(0x0150); }
"\u0151" { print(0x0151); }
"\u0152" { print(0x0152); }
"\u0153" { print(0x0153); }
"\u0154" { print(0x0154); }
"\u0155" { print(0x0155); }
"\u0156" { print(0x0156); }
"\u0157" { print(0x0157); }
"\u0158" { print(0x0158); }
"\u0159" { print(0x0159); }
"\u015A" { print(0x015A); }
"\u015B" { print(0x015B); }
"\u015C" { print(0x015C); }
"\u015D" { print(0x015D); }
"\u015E" { print(0x015E); }
"\u015F" { print(0x015F); }
"\u0160" { print(0x0160); }
"\u0161" { print(0x0161); }
"\u0162" { print(0x0162); }
"\u0163" { print(0x0163); }
"\u0164" { print(0x0164); }
"\u0165" { print(0x0165); }
"\u0166" { print(0x0166); }
"\u0167" { print(0x0167); }
"\u0168" { print(0x0168); }
"\u0169" { print(0x0169); }
"\u016A" { print(0x016A); }
"\u016B" { print(0x016B); }
"\u016C" { print(0x016C); }
"\u016D" { print(0x016D); }
"\u016E" { print(0x016E); }
"\u016F" { print(0x016F); }
"\u0170" { print(0x0170); }
"\u0171" { print(0x0171); }
"\u0172" { print(0x0172); }
"\u0173" { print(0x0173); }
"\u0174" { print(0x0174); }
"\u0175" { print(0x0175); }
"\u0176" { print(0x0176); }
"\u0177" { print(0x0177); }
"\u0178" { print(0x0178); }
"\u0179" { print(0x0179); }
"\u017A" { print(0x017A); }
"\u017B" { print(0x017B); }
"\u017C" { print(0x017C); }
"\u017D" { print(0x017D); }
"\u017E" { print(0x017E); }
"\u017F" { print(0x017F); }
"\u0181" { print(0x0181); }
"\u0182" { print(0x0182); }
"\u0183" { print(0x0183); }
"\u0184" { print(0x0184); }
"\u0185" { print(0x0185); }
"\u0186" { print(0x0186); }
"\u0187" { print(0x0187); }
"\u0188" { print(0x0188); }
"\u0189" { print(0x0189); }
"\u018A" { print(0x018A); }
"\u018B" { print(0x018B); }
"\u018C" { print(0x018C); }
"\u018E" { print(0x018E); }
"\u018F" { print(0x018F); }
"\u0190" { print(0x0190); }
"\u0191" { print(0x0191); }
"\u0192" { print(0x0192); }
"\u0193" { print(0x0193); }
"\u0194" { print(0x0194); }
"\u0195" { print(0x0195); }
"\u0196" { print(0x0196); }
"\u0197" { print(0x0197); }
"\u0198" { print(0x0198); }
"\u0199" { print(0x0199); }
"\u019C" { print(0x019C); }
"\u019D" { print(0x019D); }
"\u019F" { print(0x019F); }
"\u01A0" { print(0x01A0); }
"\u01A1" { print(0x01A1); }
"\u01A2" { print(0x01A2); }
"\u01A3" { print(0x01A3); }
"\u01A4" { print(0x01A4); }
"\u01A5" { print(0x01A5); }
"\u01A6" { print(0x01A6); }
"\u01A7" { print(0x01A7); }
"\u01A8" { print(0x01A8); }
"\u01A9" { print(0x01A9); }
"\u01AC" { print(0x01AC); }
"\u01AD" { print(0x01AD); }
"\u01AE" { print(0x01AE); }
"\u01AF" { print(0x01AF); }
"\u01B0" { print(0x01B0); }
"\u01B1" { print(0x01B1); }
"\u01B2" { print(0x01B2); }
"\u01B3" { print(0x01B3); }
"\u01B4" { print(0x01B4); }
"\u01B5" { print(0x01B5); }
"\u01B6" { print(0x01B6); }
"\u01B7" { print(0x01B7); }
"\u01B8" { print(0x01B8); }
"\u01B9" { print(0x01B9); }
"\u01BC" { print(0x01BC); }
"\u01BD" { print(0x01BD); }
"\u01BF" { print(0x01BF); }
"\u01C4" { print(0x01C4); }
"\u01C5" { print(0x01C5); }
"\u01C6" { print(0x01C6); }
"\u01C7" { print(0x01C7); }
"\u01C8" { print(0x01C8); }
"\u01C9" { print(0x01C9); }
"\u01CA" { print(0x01CA); }
"\u01CB" { print(0x01CB); }
"\u01CC" { print(0x01CC); }
"\u01CD" { print(0x01CD); }
"\u01CE" { print(0x01CE); }
"\u01CF" { print(0x01CF); }
"\u01D0" { print(0x01D0); }
"\u01D1" { print(0x01D1); }
"\u01D2" { print(0x01D2); }
"\u01D3" { print(0x01D3); }
"\u01D4" { print(0x01D4); }
"\u01D5" { print(0x01D5); }
"\u01D6" { print(0x01D6); }
"\u01D7" { print(0x01D7); }
"\u01D8" { print(0x01D8); }
"\u01D9" { print(0x01D9); }
"\u01DA" { print(0x01DA); }
"\u01DB" { print(0x01DB); }
"\u01DC" { print(0x01DC); }
"\u01DD" { print(0x01DD); }
"\u01DE" { print(0x01DE); }
"\u01DF" { print(0x01DF); }
"\u01E0" { print(0x01E0); }
"\u01E1" { print(0x01E1); }
"\u01E2" { print(0x01E2); }
"\u01E3" { print(0x01E3); }
"\u01E4" { print(0x01E4); }
"\u01E5" { print(0x01E5); }
"\u01E6" { print(0x01E6); }
"\u01E7" { print(0x01E7); }
"\u01E8" { print(0x01E8); }
"\u01E9" { print(0x01E9); }
"\u01EA" { print(0x01EA); }
"\u01EB" { print(0x01EB); }
"\u01EC" { print(0x01EC); }
"\u01ED" { print(0x01ED); }
"\u01EE" { print(0x01EE); }
"\u01EF" { print(0x01EF); }
"\u01F1" { print(0x01F1); }
"\u01F2" { print(0x01F2); }
"\u01F3" { print(0x01F3); }
"\u01F4" { print(0x01F4); }
"\u01F5" { print(0x01F5); }
"\u01F6" { print(0x01F6); }
"\u01F7" { print(0x01F7); }
"\u01F8" { print(0x01F8); }
"\u01F9" { print(0x01F9); }
"\u01FA" { print(0x01FA); }
"\u01FB" { print(0x01FB); }
"\u01FC" { print(0x01FC); }
"\u01FD" { print(0x01FD); }
"\u01FE" { print(0x01FE); }
"\u01FF" { print(0x01FF); }
"\u0200" { print(0x0200); }
"\u0201" { print(0x0201); }
"\u0202" { print(0x0202); }
"\u0203" { print(0x0203); }
"\u0204" { print(0x0204); }
"\u0205" { print(0x0205); }
"\u0206" { print(0x0206); }
"\u0207" { print(0x0207); }
"\u0208" { print(0x0208); }
"\u0209" { print(0x0209); }
"\u020A" { print(0x020A); }
"\u020B" { print(0x020B); }
"\u020C" { print(0x020C); }
"\u020D" { print(0x020D); }
"\u020E" { print(0x020E); }
"\u020F" { print(0x020F); }
"\u0210" { print(0x0210); }
"\u0211" { print(0x0211); }
"\u0212" { print(0x0212); }
"\u0213" { print(0x0213); }
"\u0214" { print(0x0214); }
"\u0215" { print(0x0215); }
"\u0216" { print(0x0216); }
"\u0217" { print(0x0217); }
"\u0218" { print(0x0218); }
"\u0219" { print(0x0219); }
"\u021A" { print(0x021A); }
"\u021B" { print(0x021B); }
"\u021C" { print(0x021C); }
"\u021D" { print(0x021D); }
"\u021E" { print(0x021E); }
"\u021F" { print(0x021F); }
"\u0222" { print(0x0222); }
"\u0223" { print(0x0223); }
"\u0224" { print(0x0224); }
"\u0225" { print(0x0225); }
"\u0226" { print(0x0226); }
"\u0227" { print(0x0227); }
"\u0228" { print(0x0228); }
"\u0229" { print(0x0229); }
"\u022A" { print(0x022A); }
"\u022B" { print(0x022B); }
"\u022C" { print(0x022C); }
"\u022D" { print(0x022D); }
"\u022E" { print(0x022E); }
"\u022F" { print(0x022F); }
"\u0230" { print(0x0230); }
"\u0231" { print(0x0231); }
"\u0232" { print(0x0232); }
"\u0233" { print(0x0233); }
"\u0253" { print(0x0253); }
"\u0254" { print(0x0254); }
"\u0256" { print(0x0256); }
"\u0257" { print(0x0257); }
"\u0259" { print(0x0259); }
"\u025B" { print(0x025B); }
"\u0260" { print(0x0260); }
"\u0263" { print(0x0263); }
"\u0268" { print(0x0268); }
"\u0269" { print(0x0269); }
"\u026F" { print(0x026F); }
"\u0272" { print(0x0272); }
"\u0275" { print(0x0275); }
"\u0280" { print(0x0280); }
"\u0283" { print(0x0283); }
"\u0288" { print(0x0288); }
"\u028A" { print(0x028A); }
"\u028B" { print(0x028B); }
"\u0292" { print(0x0292); }
"\u0345" { print(0x0345); }
"\u0386" { print(0x0386); }
"\u0388" { print(0x0388); }
"\u0389" { print(0x0389); }
"\u038A" { print(0x038A); }
"\u038C" { print(0x038C); }
"\u038E" { print(0x038E); }
"\u038F" { print(0x038F); }
"\u0391" { print(0x0391); }
"\u0392" { print(0x0392); }
"\u0393" { print(0x0393); }
"\u0394" { print(0x0394); }
"\u0395" { print(0x0395); }
"\u0396" { print(0x0396); }
"\u0397" { print(0x0397); }
"\u0398" { print(0x0398); }
"\u0399" { print(0x0399); }
"\u039A" { print(0x039A); }
"\u039B" { print(0x039B); }
"\u039C" { print(0x039C); }
"\u039D" { print(0x039D); }
"\u039E" { print(0x039E); }
"\u039F" { print(0x039F); }
"\u03A0" { print(0x03A0); }
"\u03A1" { print(0x03A1); }
"\u03A3" { print(0x03A3); }
"\u03A4" { print(0x03A4); }
"\u03A5" { print(0x03A5); }
"\u03A6" { print(0x03A6); }
"\u03A7" { print(0x03A7); }
"\u03A8" { print(0x03A8); }
"\u03A9" { print(0x03A9); }
"\u03AA" { print(0x03AA); }
"\u03AB" { print(0x03AB); }
"\u03AC" { print(0x03AC); }
"\u03AD" { print(0x03AD); }
"\u03AE" { print(0x03AE); }
"\u03AF" { print(0x03AF); }
"\u03B1" { print(0x03B1); }
"\u03B2" { print(0x03B2); }
"\u03B3" { print(0x03B3); }
"\u03B4" { print(0x03B4); }
"\u03B5" { print(0x03B5); }
"\u03B6" { print(0x03B6); }
"\u03B7" { print(0x03B7); }
"\u03B8" { print(0x03B8); }
"\u03B9" { print(0x03B9); }
"\u03BA" { print(0x03BA); }
"\u03BB" { print(0x03BB); }
"\u03BC" { print(0x03BC); }
"\u03BD" { print(0x03BD); }
"\u03BE" { print(0x03BE); }
"\u03BF" { print(0x03BF); }
"\u03C0" { print(0x03C0); }
"\u03C1" { print(0x03C1); }
"\u03C2" { print(0x03C2); }
"\u03C3" { print(0x03C3); }
"\u03C4" { print(0x03C4); }
"\u03C5" { print(0x03C5); }
"\u03C6" { print(0x03C6); }
"\u03C7" { print(0x03C7); }
"\u03C8" { print(0x03C8); }
"\u03C9" { print(0x03C9); }
"\u03CA" { print(0x03CA); }
"\u03CB" { print(0x03CB); }
"\u03CC" { print(0x03CC); }
"\u03CD" { print(0x03CD); }
"\u03CE" { print(0x03CE); }
"\u03D0" { print(0x03D0); }
"\u03D1" { print(0x03D1); }
"\u03D5" { print(0x03D5); }
"\u03D6" { print(0x03D6); }
"\u03DA" { print(0x03DA); }
"\u03DB" { print(0x03DB); }
"\u03DC" { print(0x03DC); }
"\u03DD" { print(0x03DD); }
"\u03DE" { print(0x03DE); }
"\u03DF" { print(0x03DF); }
"\u03E0" { print(0x03E0); }
"\u03E1" { print(0x03E1); }
"\u03E2" { print(0x03E2); }
"\u03E3" { print(0x03E3); }
"\u03E4" { print(0x03E4); }
"\u03E5" { print(0x03E5); }
"\u03E6" { print(0x03E6); }
"\u03E7" { print(0x03E7); }
"\u03E8" { print(0x03E8); }
"\u03E9" { print(0x03E9); }
"\u03EA" { print(0x03EA); }
"\u03EB" { print(0x03EB); }
"\u03EC" { print(0x03EC); }
"\u03ED" { print(0x03ED); }
"\u03EE" { print(0x03EE); }
"\u03EF" { print(0x03EF); }
"\u03F0" { print(0x03F0); }
"\u03F1" { print(0x03F1); }
"\u03F2" { print(0x03F2); }
"\u0400" { print(0x0400); }
"\u0401" { print(0x0401); }
"\u0402" { print(0x0402); }
"\u0403" { print(0x0403); }
"\u0404" { print(0x0404); }
"\u0405" { print(0x0405); }
"\u0406" { print(0x0406); }
"\u0407" { print(0x0407); }
"\u0408" { print(0x0408); }
"\u0409" { print(0x0409); }
"\u040A" { print(0x040A); }
"\u040B" { print(0x040B); }
"\u040C" { print(0x040C); }
"\u040D" { print(0x040D); }
"\u040E" { print(0x040E); }
"\u040F" { print(0x040F); }
"\u0410" { print(0x0410); }
"\u0411" { print(0x0411); }
"\u0412" { print(0x0412); }
"\u0413" { print(0x0413); }
"\u0414" { print(0x0414); }
"\u0415" { print(0x0415); }
"\u0416" { print(0x0416); }
"\u0417" { print(0x0417); }
"\u0418" { print(0x0418); }
"\u0419" { print(0x0419); }
"\u041A" { print(0x041A); }
"\u041B" { print(0x041B); }
"\u041C" { print(0x041C); }
"\u041D" { print(0x041D); }
"\u041E" { print(0x041E); }
"\u041F" { print(0x041F); }
"\u0420" { print(0x0420); }
"\u0421" { print(0x0421); }
"\u0422" { print(0x0422); }
"\u0423" { print(0x0423); }
"\u0424" { print(0x0424); }
"\u0425" { print(0x0425); }
"\u0426" { print(0x0426); }
"\u0427" { print(0x0427); }
"\u0428" { print(0x0428); }
"\u0429" { print(0x0429); }
"\u042A" { print(0x042A); }
"\u042B" { print(0x042B); }
"\u042C" { print(0x042C); }
"\u042D" { print(0x042D); }
"\u042E" { print(0x042E); }
"\u042F" { print(0x042F); }
"\u0430" { print(0x0430); }
"\u0431" { print(0x0431); }
"\u0432" { print(0x0432); }
"\u0433" { print(0x0433); }
"\u0434" { print(0x0434); }
"\u0435" { print(0x0435); }
"\u0436" { print(0x0436); }
"\u0437" { print(0x0437); }
"\u0438" { print(0x0438); }
"\u0439" { print(0x0439); }
"\u043A" { print(0x043A); }
"\u043B" { print(0x043B); }
"\u043C" { print(0x043C); }
"\u043D" { print(0x043D); }
"\u043E" { print(0x043E); }
"\u043F" { print(0x043F); }
"\u0440" { print(0x0440); }
"\u0441" { print(0x0441); }
"\u0442" { print(0x0442); }
"\u0443" { print(0x0443); }
"\u0444" { print(0x0444); }
"\u0445" { print(0x0445); }
"\u0446" { print(0x0446); }
"\u0447" { print(0x0447); }
"\u0448" { print(0x0448); }
"\u0449" { print(0x0449); }
"\u044A" { print(0x044A); }
"\u044B" { print(0x044B); }
"\u044C" { print(0x044C); }
"\u044D" { print(0x044D); }
"\u044E" { print(0x044E); }
"\u044F" { print(0x044F); }
"\u0450" { print(0x0450); }
"\u0451" { print(0x0451); }
"\u0452" { print(0x0452); }
"\u0453" { print(0x0453); }
"\u0454" { print(0x0454); }
"\u0455" { print(0x0455); }
"\u0456" { print(0x0456); }
"\u0457" { print(0x0457); }
"\u0458" { print(0x0458); }
"\u0459" { print(0x0459); }
"\u045A" { print(0x045A); }
"\u045B" { print(0x045B); }
"\u045C" { print(0x045C); }
"\u045D" { print(0x045D); }
"\u045E" { print(0x045E); }
"\u045F" { print(0x045F); }
"\u0460" { print(0x0460); }
"\u0461" { print(0x0461); }
"\u0462" { print(0x0462); }
"\u0463" { print(0x0463); }
"\u0464" { print(0x0464); }
"\u0465" { print(0x0465); }
"\u0466" { print(0x0466); }
"\u0467" { print(0x0467); }
"\u0468" { print(0x0468); }
"\u0469" { print(0x0469); }
"\u046A" { print(0x046A); }
"\u046B" { print(0x046B); }
"\u046C" { print(0x046C); }
"\u046D" { print(0x046D); }
"\u046E" { print(0x046E); }
"\u046F" { print(0x046F); }
"\u0470" { print(0x0470); }
"\u0471" { print(0x0471); }
"\u0472" { print(0x0472); }
"\u0473" { print(0x0473); }
"\u0474" { print(0x0474); }
"\u0475" { print(0x0475); }
"\u0476" { print(0x0476); }
"\u0477" { print(0x0477); }
"\u0478" { print(0x0478); }
"\u0479" { print(0x0479); }
"\u047A" { print(0x047A); }
"\u047B" { print(0x047B); }
"\u047C" { print(0x047C); }
"\u047D" { print(0x047D); }
"\u047E" { print(0x047E); }
"\u047F" { print(0x047F); }
"\u0480" { print(0x0480); }
"\u0481" { print(0x0481); }
"\u048C" { print(0x048C); }
"\u048D" { print(0x048D); }
"\u048E" { print(0x048E); }
"\u048F" { print(0x048F); }
"\u0490" { print(0x0490); }
"\u0491" { print(0x0491); }
"\u0492" { print(0x0492); }
"\u0493" { print(0x0493); }
"\u0494" { print(0x0494); }
"\u0495" { print(0x0495); }
"\u0496" { print(0x0496); }
"\u0497" { print(0x0497); }
"\u0498" { print(0x0498); }
"\u0499" { print(0x0499); }
"\u049A" { print(0x049A); }
"\u049B" { print(0x049B); }
"\u049C" { print(0x049C); }
"\u049D" { print(0x049D); }
"\u049E" { print(0x049E); }
"\u049F" { print(0x049F); }
"\u04A0" { print(0x04A0); }
"\u04A1" { print(0x04A1); }
"\u04A2" { print(0x04A2); }
"\u04A3" { print(0x04A3); }
"\u04A4" { print(0x04A4); }
"\u04A5" { print(0x04A5); }
"\u04A6" { print(0x04A6); }
"\u04A7" { print(0x04A7); }
"\u04A8" { print(0x04A8); }
"\u04A9" { print(0x04A9); }
"\u04AA" { print(0x04AA); }
"\u04AB" { print(0x04AB); }
"\u04AC" { print(0x04AC); }
"\u04AD" { print(0x04AD); }
"\u04AE" { print(0x04AE); }
"\u04AF" { print(0x04AF); }
"\u04B0" { print(0x04B0); }
"\u04B1" { print(0x04B1); }
"\u04B2" { print(0x04B2); }
"\u04B3" { print(0x04B3); }
"\u04B4" { print(0x04B4); }
"\u04B5" { print(0x04B5); }
"\u04B6" { print(0x04B6); }
"\u04B7" { print(0x04B7); }
"\u04B8" { print(0x04B8); }
"\u04B9" { print(0x04B9); }
"\u04BA" { print(0x04BA); }
"\u04BB" { print(0x04BB); }
"\u04BC" { print(0x04BC); }
"\u04BD" { print(0x04BD); }
"\u04BE" { print(0x04BE); }
"\u04BF" { print(0x04BF); }
"\u04C1" { print(0x04C1); }
"\u04C2" { print(0x04C2); }
"\u04C3" { print(0x04C3); }
"\u04C4" { print(0x04C4); }
"\u04C7" { print(0x04C7); }
"\u04C8" { print(0x04C8); }
"\u04CB" { print(0x04CB); }
"\u04CC" { print(0x04CC); }
"\u04D0" { print(0x04D0); }
"\u04D1" { print(0x04D1); }
"\u04D2" { print(0x04D2); }
"\u04D3" { print(0x04D3); }
"\u04D4" { print(0x04D4); }
"\u04D5" { print(0x04D5); }
"\u04D6" { print(0x04D6); }
"\u04D7" { print(0x04D7); }
"\u04D8" { print(0x04D8); }
"\u04D9" { print(0x04D9); }
"\u04DA" { print(0x04DA); }
"\u04DB" { print(0x04DB); }
"\u04DC" { print(0x04DC); }
"\u04DD" { print(0x04DD); }
"\u04DE" { print(0x04DE); }
"\u04DF" { print(0x04DF); }
"\u04E0" { print(0x04E0); }
"\u04E1" { print(0x04E1); }
"\u04E2" { print(0x04E2); }
"\u04E3" { print(0x04E3); }
"\u04E4" { print(0x04E4); }
"\u04E5" { print(0x04E5); }
"\u04E6" { print(0x04E6); }
"\u04E7" { print(0x04E7); }
"\u04E8" { print(0x04E8); }
"\u04E9" { print(0x04E9); }
"\u04EA" { print(0x04EA); }
"\u04EB" { print(0x04EB); }
"\u04EC" { print(0x04EC); }
"\u04ED" { print(0x04ED); }
"\u04EE" { print(0x04EE); }
"\u04EF" { print(0x04EF); }
"\u04F0" { print(0x04F0); }
"\u04F1" { print(0x04F1); }
"\u04F2" { print(0x04F2); }
"\u04F3" { print(0x04F3); }
"\u04F4" { print(0x04F4); }
"\u04F5" { print(0x04F5); }
"\u04F8" { print(0x04F8); }
"\u04F9" { print(0x04F9); }
"\u0531" { print(0x0531); }
"\u0532" { print(0x0532); }
"\u0533" { print(0x0533); }
"\u0534" { print(0x0534); }
"\u0535" { print(0x0535); }
"\u0536" { print(0x0536); }
"\u0537" { print(0x0537); }
"\u0538" { print(0x0538); }
"\u0539" { print(0x0539); }
"\u053A" { print(0x053A); }
"\u053B" { print(0x053B); }
"\u053C" { print(0x053C); }
"\u053D" { print(0x053D); }
"\u053E" { print(0x053E); }
"\u053F" { print(0x053F); }
"\u0540" { print(0x0540); }
"\u0541" { print(0x0541); }
"\u0542" { print(0x0542); }
"\u0543" { print(0x0543); }
"\u0544" { print(0x0544); }
"\u0545" { print(0x0545); }
"\u0546" { print(0x0546); }
"\u0547" { print(0x0547); }
"\u0548" { print(0x0548); }
"\u0549" { print(0x0549); }
"\u054A" { print(0x054A); }
"\u054B" { print(0x054B); }
"\u054C" { print(0x054C); }
"\u054D" { print(0x054D); }
"\u054E" { print(0x054E); }
"\u054F" { print(0x054F); }
"\u0550" { print(0x0550); }
"\u0551" { print(0x0551); }
"\u0552" { print(0x0552); }
"\u0553" { print(0x0553); }
"\u0554" { print(0x0554); }
"\u0555" { print(0x0555); }
"\u0556" { print(0x0556); }
"\u0561" { print(0x0561); }
"\u0562" { print(0x0562); }
"\u0563" { print(0x0563); }
"\u0564" { print(0x0564); }
"\u0565" { print(0x0565); }
"\u0566" { print(0x0566); }
"\u0567" { print(0x0567); }
"\u0568" { print(0x0568); }
"\u0569" { print(0x0569); }
"\u056A" { print(0x056A); }
"\u056B" { print(0x056B); }
"\u056C" { print(0x056C); }
"\u056D" { print(0x056D); }
"\u056E" { print(0x056E); }
"\u056F" { print(0x056F); }
"\u0570" { print(0x0570); }
"\u0571" { print(0x0571); }
"\u0572" { print(0x0572); }
"\u0573" { print(0x0573); }
"\u0574" { print(0x0574); }
"\u0575" { print(0x0575); }
"\u0576" { print(0x0576); }
"\u0577" { print(0x0577); }
"\u0578" { print(0x0578); }
"\u0579" { print(0x0579); }
"\u057A" { print(0x057A); }
"\u057B" { print(0x057B); }
"\u057C" { print(0x057C); }
"\u057D" { print(0x057D); }
"\u057E" { print(0x057E); }
"\u057F" { print(0x057F); }
"\u0580" { print(0x0580); }
"\u0581" { print(0x0581); }
"\u0582" { print(0x0582); }
"\u0583" { print(0x0583); }
"\u0584" { print(0x0584); }
"\u0585" { print(0x0585); }
"\u0586" { print(0x0586); }
"\u1E00" { print(0x1E00); }
"\u1E01" { print(0x1E01); }
"\u1E02" { print(0x1E02); }
"\u1E03" { print(0x1E03); }
"\u1E04" { print(0x1E04); }
"\u1E05" { print(0x1E05); }
"\u1E06" { print(0x1E06); }
"\u1E07" { print(0x1E07); }
"\u1E08" { print(0x1E08); }
"\u1E09" { print(0x1E09); }
"\u1E0A" { print(0x1E0A); }
"\u1E0B" { print(0x1E0B); }
"\u1E0C" { print(0x1E0C); }
"\u1E0D" { print(0x1E0D); }
"\u1E0E" { print(0x1E0E); }
"\u1E0F" { print(0x1E0F); }
"\u1E10" { print(0x1E10); }
"\u1E11" { print(0x1E11); }
"\u1E12" { print(0x1E12); }
"\u1E13" { print(0x1E13); }
"\u1E14" { print(0x1E14); }
"\u1E15" { print(0x1E15); }
"\u1E16" { print(0x1E16); }
"\u1E17" { print(0x1E17); }
"\u1E18" { print(0x1E18); }
"\u1E19" { print(0x1E19); }
"\u1E1A" { print(0x1E1A); }
"\u1E1B" { print(0x1E1B); }
"\u1E1C" { print(0x1E1C); }
"\u1E1D" { print(0x1E1D); }
"\u1E1E" { print(0x1E1E); }
"\u1E1F" { print(0x1E1F); }
"\u1E20" { print(0x1E20); }
"\u1E21" { print(0x1E21); }
"\u1E22" { print(0x1E22); }
"\u1E23" { print(0x1E23); }
"\u1E24" { print(0x1E24); }
"\u1E25" { print(0x1E25); }
"\u1E26" { print(0x1E26); }
"\u1E27" { print(0x1E27); }
"\u1E28" { print(0x1E28); }
"\u1E29" { print(0x1E29); }
"\u1E2A" { print(0x1E2A); }
"\u1E2B" { print(0x1E2B); }
"\u1E2C" { print(0x1E2C); }
"\u1E2D" { print(0x1E2D); }
"\u1E2E" { print(0x1E2E); }
"\u1E2F" { print(0x1E2F); }
"\u1E30" { print(0x1E30); }
"\u1E31" { print(0x1E31); }
"\u1E32" { print(0x1E32); }
"\u1E33" { print(0x1E33); }
"\u1E34" { print(0x1E34); }
"\u1E35" { print(0x1E35); }
"\u1E36" { print(0x1E36); }
"\u1E37" { print(0x1E37); }
"\u1E38" { print(0x1E38); }
"\u1E39" { print(0x1E39); }
"\u1E3A" { print(0x1E3A); }
"\u1E3B" { print(0x1E3B); }
"\u1E3C" { print(0x1E3C); }
"\u1E3D" { print(0x1E3D); }
"\u1E3E" { print(0x1E3E); }
"\u1E3F" { print(0x1E3F); }
"\u1E40" { print(0x1E40); }
"\u1E41" { print(0x1E41); }
"\u1E42" { print(0x1E42); }
"\u1E43" { print(0x1E43); }
"\u1E44" { print(0x1E44); }
"\u1E45" { print(0x1E45); }
"\u1E46" { print(0x1E46); }
"\u1E47" { print(0x1E47); }
"\u1E48" { print(0x1E48); }
"\u1E49" { print(0x1E49); }
"\u1E4A" { print(0x1E4A); }
"\u1E4B" { print(0x1E4B); }
"\u1E4C" { print(0x1E4C); }
"\u1E4D" { print(0x1E4D); }
"\u1E4E" { print(0x1E4E); }
"\u1E4F" { print(0x1E4F); }
"\u1E50" { print(0x1E50); }
"\u1E51" { print(0x1E51); }
"\u1E52" { print(0x1E52); }
"\u1E53" { print(0x1E53); }
"\u1E54" { print(0x1E54); }
"\u1E55" { print(0x1E55); }
"\u1E56" { print(0x1E56); }
"\u1E57" { print(0x1E57); }
"\u1E58" { print(0x1E58); }
"\u1E59" { print(0x1E59); }
"\u1E5A" { print(0x1E5A); }
"\u1E5B" { print(0x1E5B); }
"\u1E5C" { print(0x1E5C); }
"\u1E5D" { print(0x1E5D); }
"\u1E5E" { print(0x1E5E); }
"\u1E5F" { print(0x1E5F); }
"\u1E60" { print(0x1E60); }
"\u1E61" { print(0x1E61); }
"\u1E62" { print(0x1E62); }
"\u1E63" { print(0x1E63); }
"\u1E64" { print(0x1E64); }
"\u1E65" { print(0x1E65); }
"\u1E66" { print(0x1E66); }
"\u1E67" { print(0x1E67); }
"\u1E68" { print(0x1E68); }
"\u1E69" { print(0x1E69); }
"\u1E6A" { print(0x1E6A); }
"\u1E6B" { print(0x1E6B); }
"\u1E6C" { print(0x1E6C); }
"\u1E6D" { print(0x1E6D); }
"\u1E6E" { print(0x1E6E); }
"\u1E6F" { print(0x1E6F); }
"\u1E70" { print(0x1E70); }
"\u1E71" { print(0x1E71); }
"\u1E72" { print(0x1E72); }
"\u1E73" { print(0x1E73); }
"\u1E74" { print(0x1E74); }
"\u1E75" { print(0x1E75); }
"\u1E76" { print(0x1E76); }
"\u1E77" { print(0x1E77); }
"\u1E78" { print(0x1E78); }
"\u1E79" { print(0x1E79); }
"\u1E7A" { print(0x1E7A); }
"\u1E7B" { print(0x1E7B); }
"\u1E7C" { print(0x1E7C); }
"\u1E7D" { print(0x1E7D); }
"\u1E7E" { print(0x1E7E); }
"\u1E7F" { print(0x1E7F); }
"\u1E80" { print(0x1E80); }
"\u1E81" { print(0x1E81); }
"\u1E82" { print(0x1E82); }
"\u1E83" { print(0x1E83); }
"\u1E84" { print(0x1E84); }
"\u1E85" { print(0x1E85); }
"\u1E86" { print(0x1E86); }
"\u1E87" { print(0x1E87); }
"\u1E88" { print(0x1E88); }
"\u1E89" { print(0x1E89); }
"\u1E8A" { print(0x1E8A); }
"\u1E8B" { print(0x1E8B); }
"\u1E8C" { print(0x1E8C); }
"\u1E8D" { print(0x1E8D); }
"\u1E8E" { print(0x1E8E); }
"\u1E8F" { print(0x1E8F); }
"\u1E90" { print(0x1E90); }
"\u1E91" { print(0x1E91); }
"\u1E92" { print(0x1E92); }
"\u1E93" { print(0x1E93); }
"\u1E94" { print(0x1E94); }
"\u1E95" { print(0x1E95); }
"\u1E9B" { print(0x1E9B); }
"\u1EA0" { print(0x1EA0); }
"\u1EA1" { print(0x1EA1); }
"\u1EA2" { print(0x1EA2); }
"\u1EA3" { print(0x1EA3); }
"\u1EA4" { print(0x1EA4); }
"\u1EA5" { print(0x1EA5); }
"\u1EA6" { print(0x1EA6); }
"\u1EA7" { print(0x1EA7); }
"\u1EA8" { print(0x1EA8); }
"\u1EA9" { print(0x1EA9); }
"\u1EAA" { print(0x1EAA); }
"\u1EAB" { print(0x1EAB); }
"\u1EAC" { print(0x1EAC); }
"\u1EAD" { print(0x1EAD); }
"\u1EAE" { print(0x1EAE); }
"\u1EAF" { print(0x1EAF); }
"\u1EB0" { print(0x1EB0); }
"\u1EB1" { print(0x1EB1); }
"\u1EB2" { print(0x1EB2); }
"\u1EB3" { print(0x1EB3); }
"\u1EB4" { print(0x1EB4); }
"\u1EB5" { print(0x1EB5); }
"\u1EB6" { print(0x1EB6); }
"\u1EB7" { print(0x1EB7); }
"\u1EB8" { print(0x1EB8); }
"\u1EB9" { print(0x1EB9); }
"\u1EBA" { print(0x1EBA); }
"\u1EBB" { print(0x1EBB); }
"\u1EBC" { print(0x1EBC); }
"\u1EBD" { print(0x1EBD); }
"\u1EBE" { print(0x1EBE); }
"\u1EBF" { print(0x1EBF); }
"\u1EC0" { print(0x1EC0); }
"\u1EC1" { print(0x1EC1); }
"\u1EC2" { print(0x1EC2); }
"\u1EC3" { print(0x1EC3); }
"\u1EC4" { print(0x1EC4); }
"\u1EC5" { print(0x1EC5); }
"\u1EC6" { print(0x1EC6); }
"\u1EC7" { print(0x1EC7); }
"\u1EC8" { print(0x1EC8); }
"\u1EC9" { print(0x1EC9); }
"\u1ECA" { print(0x1ECA); }
"\u1ECB" { print(0x1ECB); }
"\u1ECC" { print(0x1ECC); }
"\u1ECD" { print(0x1ECD); }
"\u1ECE" { print(0x1ECE); }
"\u1ECF" { print(0x1ECF); }
"\u1ED0" { print(0x1ED0); }
"\u1ED1" { print(0x1ED1); }
"\u1ED2" { print(0x1ED2); }
"\u1ED3" { print(0x1ED3); }
"\u1ED4" { print(0x1ED4); }
"\u1ED5" { print(0x1ED5); }
"\u1ED6" { print(0x1ED6); }
"\u1ED7" { print(0x1ED7); }
"\u1ED8" { print(0x1ED8); }
"\u1ED9" { print(0x1ED9); }
"\u1EDA" { print(0x1EDA); }
"\u1EDB" { print(0x1EDB); }
"\u1EDC" { print(0x1EDC); }
"\u1EDD" { print(0x1EDD); }
"\u1EDE" { print(0x1EDE); }
"\u1EDF" { print(0x1EDF); }
"\u1EE0" { print(0x1EE0); }
"\u1EE1" { print(0x1EE1); }
"\u1EE2" { print(0x1EE2); }
"\u1EE3" { print(0x1EE3); }
"\u1EE4" { print(0x1EE4); }
"\u1EE5" { print(0x1EE5); }
"\u1EE6" { print(0x1EE6); }
"\u1EE7" { print(0x1EE7); }
"\u1EE8" { print(0x1EE8); }
"\u1EE9" { print(0x1EE9); }
"\u1EEA" { print(0x1EEA); }
"\u1EEB" { print(0x1EEB); }
"\u1EEC" { print(0x1EEC); }
"\u1EED" { print(0x1EED); }
"\u1EEE" { print(0x1EEE); }
"\u1EEF" { print(0x1EEF); }
"\u1EF0" { print(0x1EF0); }
"\u1EF1" { print(0x1EF1); }
"\u1EF2" { print(0x1EF2); }
"\u1EF3" { print(0x1EF3); }
"\u1EF4" { print(0x1EF4); }
"\u1EF5" { print(0x1EF5); }
"\u1EF6" { print(0x1EF6); }
"\u1EF7" { print(0x1EF7); }
"\u1EF8" { print(0x1EF8); }
"\u1EF9" { print(0x1EF9); }
"\u1F00" { print(0x1F00); }
"\u1F01" { print(0x1F01); }
"\u1F02" { print(0x1F02); }
"\u1F03" { print(0x1F03); }
"\u1F04" { print(0x1F04); }
"\u1F05" { print(0x1F05); }
"\u1F06" { print(0x1F06); }
"\u1F07" { print(0x1F07); }
"\u1F08" { print(0x1F08); }
"\u1F09" { print(0x1F09); }
"\u1F0A" { print(0x1F0A); }
"\u1F0B" { print(0x1F0B); }
"\u1F0C" { print(0x1F0C); }
"\u1F0D" { print(0x1F0D); }
"\u1F0E" { print(0x1F0E); }
"\u1F0F" { print(0x1F0F); }
"\u1F10" { print(0x1F10); }
"\u1F11" { print(0x1F11); }
"\u1F12" { print(0x1F12); }
"\u1F13" { print(0x1F13); }
"\u1F14" { print(0x1F14); }
"\u1F15" { print(0x1F15); }
"\u1F18" { print(0x1F18); }
"\u1F19" { print(0x1F19); }
"\u1F1A" { print(0x1F1A); }
"\u1F1B" { print(0x1F1B); }
"\u1F1C" { print(0x1F1C); }
"\u1F1D" { print(0x1F1D); }
"\u1F20" { print(0x1F20); }
"\u1F21" { print(0x1F21); }
"\u1F22" { print(0x1F22); }
"\u1F23" { print(0x1F23); }
"\u1F24" { print(0x1F24); }
"\u1F25" { print(0x1F25); }
"\u1F26" { print(0x1F26); }
"\u1F27" { print(0x1F27); }
"\u1F28" { print(0x1F28); }
"\u1F29" { print(0x1F29); }
"\u1F2A" { print(0x1F2A); }
"\u1F2B" { print(0x1F2B); }
"\u1F2C" { print(0x1F2C); }
"\u1F2D" { print(0x1F2D); }
"\u1F2E" { print(0x1F2E); }
"\u1F2F" { print(0x1F2F); }
"\u1F30" { print(0x1F30); }
"\u1F31" { print(0x1F31); }
"\u1F32" { print(0x1F32); }
"\u1F33" { print(0x1F33); }
"\u1F34" { print(0x1F34); }
"\u1F35" { print(0x1F35); }
"\u1F36" { print(0x1F36); }
"\u1F37" { print(0x1F37); }
"\u1F38" { print(0x1F38); }
"\u1F39" { print(0x1F39); }
"\u1F3A" { print(0x1F3A); }
"\u1F3B" { print(0x1F3B); }
"\u1F3C" { print(0x1F3C); }
"\u1F3D" { print(0x1F3D); }
"\u1F3E" { print(0x1F3E); }
"\u1F3F" { print(0x1F3F); }
"\u1F40" { print(0x1F40); }
"\u1F41" { print(0x1F41); }
"\u1F42" { print(0x1F42); }
"\u1F43" { print(0x1F43); }
"\u1F44" { print(0x1F44); }
"\u1F45" { print(0x1F45); }
"\u1F48" { print(0x1F48); }
"\u1F49" { print(0x1F49); }
"\u1F4A" { print(0x1F4A); }
"\u1F4B" { print(0x1F4B); }
"\u1F4C" { print(0x1F4C); }
"\u1F4D" { print(0x1F4D); }
"\u1F51" { print(0x1F51); }
"\u1F53" { print(0x1F53); }
"\u1F55" { print(0x1F55); }
"\u1F57" { print(0x1F57); }
"\u1F59" { print(0x1F59); }
"\u1F5B" { print(0x1F5B); }
"\u1F5D" { print(0x1F5D); }
"\u1F5F" { print(0x1F5F); }
"\u1F60" { print(0x1F60); }
"\u1F61" { print(0x1F61); }
"\u1F62" { print(0x1F62); }
"\u1F63" { print(0x1F63); }
"\u1F64" { print(0x1F64); }
"\u1F65" { print(0x1F65); }
"\u1F66" { print(0x1F66); }
"\u1F67" { print(0x1F67); }
"\u1F68" { print(0x1F68); }
"\u1F69" { print(0x1F69); }
"\u1F6A" { print(0x1F6A); }
"\u1F6B" { print(0x1F6B); }
"\u1F6C" { print(0x1F6C); }
"\u1F6D" { print(0x1F6D); }
"\u1F6E" { print(0x1F6E); }
"\u1F6F" { print(0x1F6F); }
"\u1F70" { print(0x1F70); }
"\u1F71" { print(0x1F71); }
"\u1F72" { print(0x1F72); }
"\u1F73" { print(0x1F73); }
"\u1F74" { print(0x1F74); }
"\u1F75" { print(0x1F75); }
"\u1F76" { print(0x1F76); }
"\u1F77" { print(0x1F77); }
"\u1F78" { print(0x1F78); }
"\u1F79" { print(0x1F79); }
"\u1F7A" { print(0x1F7A); }
"\u1F7B" { print(0x1F7B); }
"\u1F7C" { print(0x1F7C); }
"\u1F7D" { print(0x1F7D); }
"\u1F80" { print(0x1F80); }
"\u1F81" { print(0x1F81); }
"\u1F82" { print(0x1F82); }
"\u1F83" { print(0x1F83); }
"\u1F84" { print(0x1F84); }
"\u1F85" { print(0x1F85); }
"\u1F86" { print(0x1F86); }
"\u1F87" { print(0x1F87); }
"\u1F88" { print(0x1F88); }
"\u1F89" { print(0x1F89); }
"\u1F8A" { print(0x1F8A); }
"\u1F8B" { print(0x1F8B); }
"\u1F8C" { print(0x1F8C); }
"\u1F8D" { print(0x1F8D); }
"\u1F8E" { print(0x1F8E); }
"\u1F8F" { print(0x1F8F); }
"\u1F90" { print(0x1F90); }
"\u1F91" { print(0x1F91); }
"\u1F92" { print(0x1F92); }
"\u1F93" { print(0x1F93); }
"\u1F94" { print(0x1F94); }
"\u1F95" { print(0x1F95); }
"\u1F96" { print(0x1F96); }
"\u1F97" { print(0x1F97); }
"\u1F98" { print(0x1F98); }
"\u1F99" { print(0x1F99); }
"\u1F9A" { print(0x1F9A); }
"\u1F9B" { print(0x1F9B); }
"\u1F9C" { print(0x1F9C); }
"\u1F9D" { print(0x1F9D); }
"\u1F9E" { print(0x1F9E); }
"\u1F9F" { print(0x1F9F); }
"\u1FA0" { print(0x1FA0); }
"\u1FA1" { print(0x1FA1); }
"\u1FA2" { print(0x1FA2); }
"\u1FA3" { print(0x1FA3); }
"\u1FA4" { print(0x1FA4); }
"\u1FA5" { print(0x1FA5); }
"\u1FA6" { print(0x1FA6); }
"\u1FA7" { print(0x1FA7); }
"\u1FA8" { print(0x1FA8); }
"\u1FA9" { print(0x1FA9); }
"\u1FAA" { print(0x1FAA); }
"\u1FAB" { print(0x1FAB); }
"\u1FAC" { print(0x1FAC); }
"\u1FAD" { print(0x1FAD); }
"\u1FAE" { print(0x1FAE); }
"\u1FAF" { print(0x1FAF); }
"\u1FB0" { print(0x1FB0); }
"\u1FB1" { print(0x1FB1); }
"\u1FB3" { print(0x1FB3); }
"\u1FB8" { print(0x1FB8); }
"\u1FB9" { print(0x1FB9); }
"\u1FBA" { print(0x1FBA); }
"\u1FBB" { print(0x1FBB); }
"\u1FBC" { print(0x1FBC); }
"\u1FBE" { print(0x1FBE); }
"\u1FC3" { print(0x1FC3); }
"\u1FC8" { print(0x1FC8); }
"\u1FC9" { print(0x1FC9); }
"\u1FCA" { print(0x1FCA); }
"\u1FCB" { print(0x1FCB); }
"\u1FCC" { print(0x1FCC); }
"\u1FD0" { print(0x1FD0); }
"\u1FD1" { print(0x1FD1); }
"\u1FD8" { print(0x1FD8); }
"\u1FD9" { print(0x1FD9); }
"\u1FDA" { print(0x1FDA); }
"\u1FDB" { print(0x1FDB); }
"\u1FE0" { print(0x1FE0); }
"\u1FE1" { print(0x1FE1); }
"\u1FE5" { print(0x1FE5); }
"\u1FE8" { print(0x1FE8); }
"\u1FE9" { print(0x1FE9); }
"\u1FEA" { print(0x1FEA); }
"\u1FEB" { print(0x1FEB); }
"\u1FEC" { print(0x1FEC); }
"\u1FF3" { print(0x1FF3); }
"\u1FF8" { print(0x1FF8); }
"\u1FF9" { print(0x1FF9); }
"\u1FFA" { print(0x1FFA); }
"\u1FFB" { print(0x1FFB); }
"\u1FFC" { print(0x1FFC); }
"\u2126" { print(0x2126); }
"\u212A" { print(0x212A); }
"\u212B" { print(0x212B); }
"\u2160" { print(0x2160); }
"\u2161" { print(0x2161); }
"\u2162" { print(0x2162); }
"\u2163" { print(0x2163); }
"\u2164" { print(0x2164); }
"\u2165" { print(0x2165); }
"\u2166" { print(0x2166); }
"\u2167" { print(0x2167); }
"\u2168" { print(0x2168); }
"\u2169" { print(0x2169); }
"\u216A" { print(0x216A); }
"\u216B" { print(0x216B); }
"\u216C" { print(0x216C); }
"\u216D" { print(0x216D); }
"\u216E" { print(0x216E); }
"\u216F" { print(0x216F); }
"\u2170" { print(0x2170); }
"\u2171" { print(0x2171); }
"\u2172" { print(0x2172); }
"\u2173" { print(0x2173); }
"\u2174" { print(0x2174); }
"\u2175" { print(0x2175); }
"\u2176" { print(0x2176); }
"\u2177" { print(0x2177); }
"\u2178" { print(0x2178); }
"\u2179" { print(0x2179); }
"\u217A" { print(0x217A); }
"\u217B" { print(0x217B); }
"\u217C" { print(0x217C); }
"\u217D" { print(0x217D); }
"\u217E" { print(0x217E); }
"\u217F" { print(0x217F); }
"\u24B6" { print(0x24B6); }
"\u24B7" { print(0x24B7); }
"\u24B8" { print(0x24B8); }
"\u24B9" { print(0x24B9); }
"\u24BA" { print(0x24BA); }
"\u24BB" { print(0x24BB); }
"\u24BC" { print(0x24BC); }
"\u24BD" { print(0x24BD); }
"\u24BE" { print(0x24BE); }
"\u24BF" { print(0x24BF); }
"\u24C0" { print(0x24C0); }
"\u24C1" { print(0x24C1); }
"\u24C2" { print(0x24C2); }
"\u24C3" { print(0x24C3); }
"\u24C4" { print(0x24C4); }
"\u24C5" { print(0x24C5); }
"\u24C6" { print(0x24C6); }
"\u24C7" { print(0x24C7); }
"\u24C8" { print(0x24C8); }
"\u24C9" { print(0x24C9); }
"\u24CA" { print(0x24CA); }
"\u24CB" { print(0x24CB); }
"\u24CC" { print(0x24CC); }
"\u24CD" { print(0x24CD); }
"\u24CE" { print(0x24CE); }
"\u24CF" { print(0x24CF); }
"\u24D0" { print(0x24D0); }
"\u24D1" { print(0x24D1); }
"\u24D2" { print(0x24D2); }
"\u24D3" { print(0x24D3); }
"\u24D4" { print(0x24D4); }
"\u24D5" { print(0x24D5); }
"\u24D6" { print(0x24D6); }
"\u24D7" { print(0x24D7); }
"\u24D8" { print(0x24D8); }
"\u24D9" { print(0x24D9); }
"\u24DA" { print(0x24DA); }
"\u24DB" { print(0x24DB); }
"\u24DC" { print(0x24DC); }
"\u24DD" { print(0x24DD); }
"\u24DE" { print(0x24DE); }
"\u24DF" { print(0x24DF); }
"\u24E0" { print(0x24E0); }
"\u24E1" { print(0x24E1); }
"\u24E2" { print(0x24E2); }
"\u24E3" { print(0x24E3); }
"\u24E4" { print(0x24E4); }
"\u24E5" { print(0x24E5); }
"\u24E6" { print(0x24E6); }
"\u24E7" { print(0x24E7); }
"\u24E8" { print(0x24E8); }
"\u24E9" { print(0x24E9); }
"\uFF21" { print(0xFF21); }
"\uFF22" { print(0xFF22); }
"\uFF23" { print(0xFF23); }
"\uFF24" { print(0xFF24); }
"\uFF25" { print(0xFF25); }
"\uFF26" { print(0xFF26); }
"\uFF27" { print(0xFF27); }
"\uFF28" { print(0xFF28); }
"\uFF29" { print(0xFF29); }
"\uFF2A" { print(0xFF2A); }
"\uFF2B" { print(0xFF2B); }
"\uFF2C" { print(0xFF2C); }
"\uFF2D" { print(0xFF2D); }
"\uFF2E" { print(0xFF2E); }
"\uFF2F" { print(0xFF2F); }
"\uFF30" { print(0xFF30); }
"\uFF31" { print(0xFF31); }
"\uFF32" { print(0xFF32); }
"\uFF33" { print(0xFF33); }
"\uFF34" { print(0xFF34); }
"\uFF35" { print(0xFF35); }
"\uFF36" { print(0xFF36); }
"\uFF37" { print(0xFF37); }
"\uFF38" { print(0xFF38); }
"\uFF39" { print(0xFF39); }
"\uFF3A" { print(0xFF3A); }
"\uFF41" { print(0xFF41); }
"\uFF42" { print(0xFF42); }
"\uFF43" { print(0xFF43); }
"\uFF44" { print(0xFF44); }
"\uFF45" { print(0xFF45); }
"\uFF46" { print(0xFF46); }
"\uFF47" { print(0xFF47); }
"\uFF48" { print(0xFF48); }
"\uFF49" { print(0xFF49); }
"\uFF4A" { print(0xFF4A); }
"\uFF4B" { print(0xFF4B); }
"\uFF4C" { print(0xFF4C); }
"\uFF4D" { print(0xFF4D); }
"\uFF4E" { print(0xFF4E); }
"\uFF4F" { print(0xFF4F); }
"\uFF50" { print(0xFF50); }
"\uFF51" { print(0xFF51); }
"\uFF52" { print(0xFF52); }
"\uFF53" { print(0xFF53); }
"\uFF54" { print(0xFF54); }
"\uFF55" { print(0xFF55); }
"\uFF56" { print(0xFF56); }
"\uFF57" { print(0xFF57); }
"\uFF58" { print(0xFF58); }
"\uFF59" { print(0xFF59); }
"\uFF5A" { print(0xFF5A); }
. { }
