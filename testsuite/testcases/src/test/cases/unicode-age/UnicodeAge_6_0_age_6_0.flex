%%

%unicode 6.0
%public
%class UnicodeAge_6_0_age_6_0

%type int
%standalone

%include ../../resources/common-unicode-enumerated-property-defined-values-only-java

%%

<<EOF>> { printOutput(); return 1; }
\p{Age:6.0} { setCurCharPropertyValue("Age:6.0"); }
[^] { }
