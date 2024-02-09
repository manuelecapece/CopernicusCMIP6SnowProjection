function eliminaDataset(isInApp, path1, path2)
%ripulisce la cartella dataset dai dataset scaricati con le richieste

if (~isInApp)
    cd('dataset\');
else
    cd(path1);
end

currentDirectory = pwd;

subfolders = dir(currentDirectory); % Ottieni la lista delle cartelle nella cartella specificata

% Itera attraverso tutte le cartelle (escludendo . e ..)
for i = 1:numel(subfolders)
    if subfolders(i).isdir && ~strcmp(subfolders(i).name, '.') && ~strcmp(subfolders(i).name, '..')
        subfolderPath = fullfile(currentDirectory, subfolders(i).name);
        rmdir(subfolderPath, 's'); % Elimina la cartella e tutti i suoi contenuti
    end
end

if (~isInApp)
    cd('..\');
else
    cd(path2);
end

end