% Creazione di dati di esempio per 5 categorie
categorie = {'Categoria 1', 'Categoria 2', 'Categoria 3', 'Categoria 4', 'Categoria 5'};
dati1 = [10, 25, 15, 20, 30];
dati2 = [15, 20, 10, 25, 18];

% Creazione del grafico a barre con 5 categorie senza spazi bianchi
figure;
bar(1:5, [dati1; dati2]', 'grouped', 'BarWidth',1); % Puoi regolare la larghezza a tuo piacimento

% Aggiunta di etichette e titoli
xlabel('Categorie');
ylabel('Dati');
title('Grafico a Barre con 5 Categorie e Legenda');

% Aggiunta della legenda
legend('Dati 1', 'Dati 2');

% Personalizzazione del grafico (opzionale)
grid on;


