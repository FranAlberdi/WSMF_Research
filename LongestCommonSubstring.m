function [LCS, len] = LongestCommonSubstring(A,B)
%% Description
%Author: Francisco Alberdi
%Date: 2021.10.19

%This function, given two strings, finds the length of the longest common 
%substring and returns said substring. Dynamic Programming isused to find 
%the longest common substring in O(m*n) time. The idea is to find the 
%length of the longest common suffix for all substrings of both strings and 
%store these lengths in a table. 
%   Input:
%       A - input string to be analyzed
%       B - input string to be analyzed
%   Output:
%       LCS - longest common substring found between A and B, returns empty
%           if the longest common substring is not found
%       len - length of the longest common substring, returns -1 if the 
%           longest common substring is not found
% Time Complexity: O(m*n) 
% Auxiliary Space: O(m*n)
% where m and n are the respective lengths of the strings
%% Initialization
LCSmatrix = zeros(length(A) + 1,length(B) + 1);
len = -1;
row = 1;
col = 1;
LCS = '';

%% Find LCS
for i = 1:length(A) + 1
    for j = 1:length(B) + 1
        if i == 1 || j == 1
        elseif A(i - 1) == B(j - 1)
            LCSmatrix(i,j) = LCSmatrix(i - 1, j - 1) + 1;
            if len < LCSmatrix(i, j)
                row = i;
                col = j;
                len = LCSmatrix(i, j);
            end
        else
            LCSmatrix(i,j) = 0;
        end
    end
end

%% Prepare Output
lenCopy = len;
if len > 0
    while row > 0 && col > 0 && LCSmatrix(row,col) ~= 0
        LCS(lenCopy) = A(row - 1);
        lenCopy = lenCopy - 1;
        row = row - 1;
        col = col - 1;
    end
end
end
