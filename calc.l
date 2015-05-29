/*
 *  calc.l  : Tom Conley
 *
 *  File    : Starter file for LEX/YACC assignment
 *  Author  : Tom Conley, Ohio University
 *  Created : March 31 2015
 *  Version : <none>
 *  
 *  Class   : CS 4100/5100 -- Spring 15
 *
 *    Copyright (c) 2015  Ohio University. All rights reserved.
 *    This program is free software; you can redistribute it and/or
 *    modify it under the same terms as lex itself.
 *
 */
%{
    #include <iostream>
    using namespace std;
    #include "calc.tab.hh"
%}

 /*-------- lex options here --------*/ 
%option noyywrap
%option nounput

 /*-------- regex macros here --------*/ 
ws [ \t\n]+

zero        (zero|none|zip|zilch|nada|sweet{ws}fanny)
one         (one|uno|eins|moja|一|(the{ws})?loneliest{ws}number)
two         (two|dos|mbili|swei|二)
three       (three|tre|tatu|drei|三)
four        (four|cuatro|quartet)
five        (five|cinco|quintet)
six         (six|seis|sei|sex)
seven       (seven|siete|sete)
eight       (eight|ocho|oto)
nine        (nine|nueve|nove)
fifty       (fiddy|fifty|half{ws}a{ws}buck)

plus        (plus|added({ws}to)?|and|加)
minus       (minus|take({ws}away)?|and|减)
times       (times|multiplied{ws}by)
divide      (divide|goes{ws}into|guzzinta)
abs         (absolute{ws}value|absolute{ws}value{ws}of)
sqrt        (square{ws}root|square{ws}root{ws}of|the{ws}square{ws}root{ws}of)

operator    ([\*|/\+|\-\(\);])

pp    (\+\+)

what (what{ws}is)?

%%  /*-------- lexer definition begins here --------*/ 

[0-9]+   	{ yylval.ival = atoi(yytext); return NUMBER; }

 /* comment here */
{plus}      { return '+'; }
{minus}     { return '-'; }
{times}       { return '*'; }
{divide}      { return '/'; }

{abs}       { return ABS; }
{sqrt}      { return SQRT; }

{operator}  { return yytext[0]; }

{zero}      { 
                yylval.ival = 0; 
                return(NUMBER); 
            }

{one}       { 
                yylval.ival = 1; 
                return(NUMBER); 
            }
{two}       { 
                yylval.ival = 2; 
                return(NUMBER); 
            }
{three}     { 
                yylval.ival = 3; 
                return(NUMBER); 
            }
{four}      {
                yylval.ival = 4;
                return(NUMBER);
            }

{five}      {
                yylval.ival = 5;
                return(NUMBER);
            }

{six}       {
                yylval.ival = 6;
                return(NUMBER);
        }

{seven}     { yylval.ival = 7; return NUMBER; }
eight       { yylval.ival = 8; return NUMBER; }
nine        { yylval.ival = 9; return NUMBER; }
ten         { yylval.ival = 10; return NUMBER; }
eleven      { yylval.ival = 11; return NUMBER; }
twelve      { yylval.ival = 12; return NUMBER; }
thirteen    { yylval.ival = 13; return NUMBER; }
fourteen    { yylval.ival = 14; return NUMBER; }
fifteen     { yylval.ival = 15; return NUMBER; }
sixteen     { yylval.ival = 16; return NUMBER; }
seventeen   { yylval.ival = 17; return NUMBER; }
eighteen    { yylval.ival = 18; return NUMBER; }
nineteen    { yylval.ival = 19; return NUMBER; }
twenty      { yylval.ival = 20; return NUMBER; }
thirty      { yylval.ival = 30; return NUMBER; }
forty       { yylval.ival = 40; return NUMBER; }
fifty       { yylval.ival = 50; return NUMBER; }
sixty       { yylval.ival = 60; return NUMBER; }
seventy     { yylval.ival = 70; return NUMBER; }
eighty      { yylval.ival = 80; return NUMBER; }
nintey      { yylval.ival = 90; return NUMBER; }
hundred     { yylval.ival = 100; return MULTIPLIER; }
thousand    { yylval.ival = 1000; return MULTIPLIER; }
million     { yylval.ival = 1000000; return MULTIPLIER; }
billion     { yylval.ival = 1000000000; return MULTIPLIER; }


{pp}        { return (PP); }

{what}      {/* ignore */ }
{ws} 		{ /* ignore */ }

.        	{ cerr << "Unrecognized token!" << endl; }

%%