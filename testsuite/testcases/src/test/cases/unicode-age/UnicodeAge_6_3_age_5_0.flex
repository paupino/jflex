%%

%unicode 6.3
%public
%class UnicodeAge_6_3_age_5_0

%type int
%standalone

%include ../../resources/common-unicode-enumerated-property-defined-values-only-java

%%

<<EOF>> { printOutput(); return 1; }
\p{Age:5.0} { setCurCharPropertyValue("Age:5.0"); }
[^] { }
