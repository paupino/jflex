%%

%unicode 5.0
%public
%class UnicodeDerivedCoreProperties_Lowercase_5_0

%type int
%standalone

%include ../../resources/common-unicode-binary-property-java

%%

\p{Lowercase} { setCurCharPropertyValue(); }
[^] { }

<<EOF>> { printOutput(); return 1; }
