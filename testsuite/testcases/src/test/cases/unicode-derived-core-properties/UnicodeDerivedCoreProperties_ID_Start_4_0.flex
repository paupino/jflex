%%

%unicode 4.0
%public
%class UnicodeDerivedCoreProperties_ID_Start_4_0

%type int
%standalone

%include ../../resources/common-unicode-binary-property-java

%%

\p{ID_Start} { setCurCharPropertyValue(); }
[^] { }

<<EOF>> { printOutput(); return 1; }
