function eliminaDataset()
%ripulisce la cartella dataset dai dataset scaricati con le richieste

cd('dataset\')

currentDirectory = pwd;

subfolders = dir(currentDirectory); % Ottieni la lista delle cartelle nella cartella specificata

% Itera attraverso tutte le cartelle (escludendo . e ..)
for i = 1:numel(subfolders)
    if subfolders(i).isdir && ~strcmp(subfolders(i).name, '.') && ~strcmp(subfolders(i).name, '..')
        subfolderPath = fullfile(currentDirectory, subfolders(i).name);
        rmdir(subfolderPath, 's'); % Elimina la cartella e tutti i suoi contenuti
    end
end

cd('..\')

end

