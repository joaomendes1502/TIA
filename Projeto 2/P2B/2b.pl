  arco(braga, porto).
  arco(porto, braga).
  arco(braga, viseu).
  arco(viseu, braga).
  arco(porto, lisboa).
  arco(lisboa, porto).
  arco(lisboa, faro).
  arco(faro, lisboa).
  arco(porto, viseu).
  arco(viseu, porto).
  arco(braga, guimaraes).
  arco(guimaraes, braga). 
  arco(guimaraes, porto).
  arco(porto, guimaraes).
  arco(viseu,coimbra).
  arco(coimbra, viseu).
  arco(coimbra,braga).
  arco(braga, coimbra).
  arco(coimbra,lisboa).
  arco(lisboa, coimbra).

  transporte(braga, porto, autocarro, 70, 14).
  transporte(braga, porto, comboio, 50, 3).
  transporte(braga, porto, automovel, 40, 15).
  transporte(braga, viseu, automovel, 200, 90).
  transporte(porto, lisboa, autocarro, 150, 25).
  transporte(porto, lisboa, comboio, 180, 60).
  transporte(porto, lisboa, automovel, 150, 90).
  transporte(porto, lisboa, aviao, 120, 130).
  transporte(lisboa, faro, comboio, 240, 80).
  transporte(lisboa, faro, automovel, 200, 150).
  transporte(lisboa, faro, aviao, 120, 140).
  transporte(lisboa, faro, autocarro, 240, 70).
  transporte(porto, viseu, autocarro, 250, 60).
  transporte(porto, viseu, automovel, 200, 90).
  transporte(porto, viseu, comboio, 260, 70).
  transporte(braga, guimaraes, automovel, 20, 10).
  transporte(braga, guimaraes, autocarro, 30, 15).
  transporte(guimaraes, porto, automovel, 50, 14).
  transporte(guimaraes, porto, comboio, 70, 3).
  transporte(guimaraes, porto, autocarro, 60, 12).
  transporte(viseu, coimbra, automovel, 100, 40).
  transporte(coimbra, braga, automovel, 90, 60).
  transporte(coimbra, lisboa, comboio, 120, 30).
  transporte(porto, braga, autocarro, 70, 14).
  transporte(porto, braga, comboio, 50, 3).
  transporte(porto, braga, automovel, 40, 15).
  transporte(viseu, braga, automovel, 200, 90).
  transporte(lisboa, porto, autocarro, 150, 25).
  transporte(lisboa, porto, comboio, 180, 60).
  transporte(lisboa, porto, automovel, 150, 90).
  transporte(lisboa, porto, aviao, 120, 130).
  transporte(faro, lisboa, comboio, 240, 80).
  transporte(faro, lisboa, automovel, 200, 150).
  transporte(faro, lisboa, aviao, 120, 140).
  transporte(faro, lisboa, autocarro, 240, 70).
  transporte(viseu, porto, autocarro, 250, 60).
  transporte(viseu, porto, automovel, 200, 90).
  transporte(viseu, porto, comboio, 260, 70).
  transporte(guimaraes, braga, automovel, 20, 10).
  transporte(guimaraes, braga, autocarro, 30, 15).
  transporte(porto, guimaraes, automovel, 50, 14).
  transporte(porto, guimaraes, comboio, 70, 3).
  transporte(porto, guimaraes, autocarro, 60, 12).
  transporte(coimbra, viseu, automovel, 100, 40).
  transporte(braga, coimbra, automovel, 90, 60).
  transporte(lisboa, coimbra, comboio, 120, 30).

  melhorCaminho(X,Y):-
      caminho(X,Y,Caminho), % gerar
      maisbarato(X,Y,Caminho,Custo,Transportes),
      write('Trajeto: '), reverse(Caminho, C) , write(C),nl,
      transportesUtilizados(Caminho, Transportes),
      write('Preco*Duracao: '), write(Custo).

  maisbarato(X,Y,Caminho, Custo, Transportes):-
      custoTotal(Caminho,Custo, Transportes),
      \+ barato(X,Y,Custo).

  barato(X,Y,Custo):-
      caminho(X,Y,C1),
      custoTotal(C1,NC,_),
      NC < Custo.

  caminho(X,Z,Caminho):-caminho(X,Z,[X],Caminho).
  caminho(X,X,Caminho,Caminho).
  caminho(X,Z,Visitado,Caminho)
   :- arco(X,Y),
   \+ member(Y,Visitado),
  caminho(Y,Z,[Y | Visitado],Caminho).

  custoTotal([_],0,[]).
  custoTotal([A,B|C], Custo, [Transporte|Transportes]) :-
      transporte(B,A,Transporte,T,X),
      custoTotal([B|C], Y, Transportes),
      Custo is X * T + Y.

  transportesUtilizados([_], []).
	transportesUtilizados([A,B|C], [Transporte|Transportes]) :-
    transporte(A,B,Transporte,T,Custo),
    transportesUtilizados([B|C], Transportes),
    write('De '), write(B), write(' para '), write(A),
    write(' | Transporte: '), write(Transporte),
    write(' | Custo: '), write(Custo), write(' euros'),
    write(' | Tempo: '), write(T), write(' minutos'), nl.