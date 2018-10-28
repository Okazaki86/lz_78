clc
clear
close all
%%%%%%%%%%%%%%
x = input('Enter encodings : ', 's');
x = string(strsplit(x, ' '));
lz_decode(x);

function decode = lz_decode(encode)
    decode = "";
    phrases = [];
    for i = 1:length(encode)
        [pos, value] = get_splits(encode(i));
        if(pos == 0)
            decode = decode + value;
            phrases = [phrases, value];
            continue
        end
        decode = decode + phrases(pos) + value;
        phrases = [phrases, phrases(pos) + value];
    end
    disp("Decoding : ")
    disp(decode)
end

function [pos, value] = get_splits(x)
    split = strsplit(x,",");
    split1 = strsplit(split(1),"(");
    split2 = strsplit(split(2),")");
    value = split2(1);
    pos = double(split1(2));
end