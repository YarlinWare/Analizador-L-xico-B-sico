package codigoLexicoBasico;
import static codigoLexicoBasico.Tokens.*;
%%
%class LexicoBasico
%type Tokens
L=[a-zA-Z_]+
D=[0-9]+
espacio=[ ,\t,\r,\n]
%{
    public String lexemas;
%}
%%
int |
main |
if |
else |
for |
void |
char |
float |
double |
case |
switch |
while {lexemas=yytext(); return Reservadas;}
{espacio} {/*Ignore*/}
"//".* {/*Ignore*/}
"=" {return Igual;}
"=" {return Equivalente;}
"!=" {return Diferencia;}
"+" {return Suma;}
"-" {return Resta;}
"*" {return Multiplicacion;}
"/" {return Division;}
";" {return P_coma;}
"{" {return Llave_apertura;}
"}" {return Llave_cierre;}
"(" {return Parentesis_apertura;}
")" {return Parentesis_cierre;}


"<" {return Menor_que;}
"<<" {return Menor_menor;}
">" {return Mayor_que;}
">>" {return Mayor_mayor;}

"++" {return Incremento;}
"--" {return Decremento;}


{L}({L}|{D})* {lexemas=yytext(); return Identificador;}
("(-"{D}+")")|{D}+ {lexemas=yytext(); return Numero;}
 . {return ERROR;}
