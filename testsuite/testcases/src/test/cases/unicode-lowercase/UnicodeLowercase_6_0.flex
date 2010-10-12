%%

%unicode 6.0
%public
%class UnicodeLowercase_6_0

%type int
%standalone

%include src/test/resources/common-unicode-enumerated-property-java

%%

<<EOF>> { printOutput(); return 1; }
[:lowercase:] { setCurCharPropertyValue("Lowercase"); }
[^[:lowercase:]] { setCurCharPropertyValue("Not-Lowercase"); }
