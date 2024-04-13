:- dynamic(fact/1),
[forward, basededados, basedeconhecimento].



menu :- nl,nl , write('********************************************************************************************************'), nl,
			write('Hora de viajar! Antes de iniciar, qual o seu nome?'),nl,
			read(Nome) ,nl,
			
			write('Prazer ajuda-lo/a Sr./a '), write(Nome) ,nl,nl,nl,
					 
			write('Vamos agora descobrir qual o meio de transporte mais recomendado para a sua viagem!'), nl,
			write('Faremos algumas perguntas para o/a ajudar na sua escolha!'), nl, 
			
			write(' Menu:'), nl,
			
			write('  1- Iniciar'), nl,
			write('  2- Sair'), nl,nl,
			read(Opcao),
			avaliarEscolha(Opcao).

avaliarEscolha(1):- questao1.
avaliarEscolha(2):- write('Terminado'), halt.
avaliarEscolha(other):- write('Opcao invalida. Volte a escolher.'), menu.

questao1 :-	write('********************************************************************************************************'), nl,
	write('Qual a origem da sua viagem? Introduza o numero correspondente:'), nl,
	
                write(' 1 - Braga'), nl,
                write(' 2 - Porto'), nl,
                write(' 3 - Viseu'), nl,
				write(' 4 - Lisboa'), nl,
				write(' 5 - Coimbra'), nl,

	read(Q1),
            	(
            	(Q1 == 1), assert(fact(origembraga)), questao2;
            	(Q1 == 2), assert(fact(origemporto)), questao2;
            	(Q1 == 3), assert(fact(origemviseu)), questao2;
		(Q1 == 4), assert(fact(origemlisboa)), questao2;
		(Q1 == 5), assert(fact(origemcoimbra)), questao2).


questao2 :-
    write('********************************************************************************************************'), nl,
    write(' Qual e o seu destino? Destas opções, introduza o numero correspondente:'), nl,
    write(' 1 - Braga'), nl,
    write(' 2 - Porto'), nl,
    write(' 3 - Viseu'), nl,
    write(' 4 - Lisboa'), nl,
    write(' 5 - Coimbra'), nl,
    read(Q2),
    (
        (fact(origembraga), Q2 == 1) -> (write('Destino não pode ser igual a origem. Tente novamente.'), questao2);
        (fact(origemporto), Q2 == 2) -> (write('Destino não pode ser igual a origem. Tente novamente.'), questao2);
        (fact(origemviseu), Q2 == 3) -> (write('Destino não pode ser igual a origem. Tente novamente.'), questao2);
        (fact(origemlisboa), Q2 == 4) -> (write('Destino não pode ser igual a origem. Tente novamente.'), questao2);
        (fact(origemcoimbra), Q2 == 5) -> (write('Destino não pode ser igual a origem. Tente novamente.'), questao2);
        (Q2 == 1) -> assert(fact(braga)), questao3;
        (Q2 == 2) -> assert(fact(porto)), questao3;
        (Q2 == 3) -> assert(fact(viseu)), questao3;
        (Q2 == 4) -> assert(fact(lisboa)), questao3;
        (Q2 == 5) -> assert(fact(coimbra)), questao3
    ).



questao3 :-	write('********************************************************************************************************'), nl,
	write('Pretende realizar uma viagem rapida ou demorada?:'), nl,
	write(' 1 - Rapida'), nl,
	write(' 2 - Demorada'),nl,	
	read(Q3),
	(
	(Q3 == 1), assert(fact(rapida)), questao4;
        (Q3 == 2), assert(fact(demorada)), questao4).

questao4 :-	write('********************************************************************************************************'), nl,
	write('Tem poderio financeiro? Escolha uma das opçoes:'), nl,
	
	write(' 1 - Sim'), nl,
	write(' 2 - Não'),nl,
	read(Q4),
	(
	(Q4 == 1), assert(fact(poderiofinanceiro)), questao5;
        (Q4 == 2), assert(fact(naopoderiofinanceiro)), questao5).



questao5:-	write('********************************************************************************************************'), nl,
	write(' Pretende optar por um transporte que polua menos?:'), nl,
	write(' 1 - Sim'), nl,
	write(' 2 - Não'),nl,	
	read(Q5),
	(
	(Q5 == 1), assert(fact(ambiente)), consulta;
        (Q5 == 2), assert(fact(naoambiente)), consulta).



consulta :- demo, resultado.

resultado:- fact(Transp), fact(Origem), fact(Destino), transporte(Transp, Origem, Destino, Duracao, Custo), 
write(' Transporte recomendado: '), write(Transp), nl,
write(' Duracao (em minutos): '), write(Duracao), nl,
write(' Custo (em euros): '), write(Custo).
