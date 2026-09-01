Fase de gelo, o jogador tem que pular plataformas e precipicios, passa pela  ponte até chegar a caverna. Peguei o tema  de gelo e montanhas para combinar com a outra fase de cavernas.

Fase caverna, o jogador pular chao desabando e agua dentro da caverna, passa por pontes, a caverna esta abandonada e possivelmente era uma mina que foi abandonada.

O parallax- a montanha grande coloquei 0.1 para ficar como muito longe ela, as montanhas menores coloquei 0.3 de motion, para dar a sencacao de um pouco mais perto, e o chao coloquei 0.7 para ficar um pouco mais perto, o que mudou nas tentativas foi que tive problema com tremedeira das imagens em relacao de valores do Motion Scale.

A area secreta- tem 2 areas de desvios, uma que ir reto nas paredes caidas com uma fresta da acesso a um corredor para a saida, a outra passando a ultima agua parada o personagem cai em baixo em um caminho alternativo para a saida da caverna.

A transicao- Troca de fase nao pode ser chamada direto na colisao devido a ser instantaneo e deixar a experiencia ruim.

O que travou- Ajustar o parallax foi o que mais me travou, a imagem tremia, ficava esticada e fora do padrao da textura, ficava torta. Arrumei  no motion scale, mudei o x, y, que estava colocando errado, e arrumei a escala


Tem algum  bug acontecendo que nao consegui resolver, as transferencias de fases estao acontecendo normal, mas quando esta gravando depois que passo pelo primeiro LevelEnd, simplesmente os outros nao funcionam e nao consigo usar nenhum mais.
