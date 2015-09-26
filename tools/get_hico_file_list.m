
%create a list_file for HICO 
set = 'train';
RESULT_FILE = strcat('hico_file_list_',set,'.txt');
ANNO_FILE = '/home/datasets/hico_20150331/anno.mat';

load(ANNO_FILE);

fileID = fopen(RESULT_FILE,'w');

if(strcmp(set,'test') == 1)
file_len_test = size(list_test,1);
    for i=1:file_len_test
        if mod(i, 100) == 1
            fprintf('processing %d/%d\n', i, file_len_test);
        end
       %temp = strsplit(char(list_test(i)),'.'); 
       %filename = char(temp(1));
       %fprintf(fileID, '%s ', filename);
       fprintf(fileID, '%s ', char(list_test(i)));
       for j = 1:600
        fprintf(fileID,'%d ',anno_test(j,i)>0);
       end
       fprintf(fileID,'\n');   
    end
end

if(strcmp(set,'train') == 1)
file_len_train = size(list_train,1);
    for i=1:file_len_train
        if mod(i, 100) == 1
            fprintf('processing %d/%d\n', i, file_len_train);
        end
       %temp = strsplit(char(list_train(i)),'.'); 
       %filename = char(temp(1));
       %fprintf(fileID, '%s ', filename);
       fprintf(fileID, '%s ', char(list_train(i)));
       for j = 1:600
        fprintf(fileID,'%d ',anno_train(j,i)>0);
       end
       fprintf(fileID,'\n');   
    end
end

fprintf('done\n');
fclose(fileID);
