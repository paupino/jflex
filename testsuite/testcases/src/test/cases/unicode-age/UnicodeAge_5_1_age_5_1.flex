%%

%unicode 5.1
%public
%class UnicodeAge_5_1_age_5_1

%type int
%standalone

%include ../../resources/common-unicode-enumerated-property-defined-values-only-java

%%

<<EOF>> { printOutput(); return 1; }
\p{Age:5.1} { setCurCharPropertyValue("Age:5.1"); }
[^] { }
