%%

%unicode 6.3
%public
%class UnicodeDerivedCoreProperties_Changes_When_Lowercased_6_3

%type int
%standalone

%include ../../resources/common-unicode-binary-property-java

%%

\p{Changes_When_Lowercased} { setCurCharPropertyValue(); }
[^] { }

<<EOF>> { printOutput(); return 1; }
