clc

%
% first, randomly construct the sampling distribution for each sample size. 
% Then, for each sampling distribution, calculate the mean and variance
% in order to compare with the mean and variance  of the population distribution. 
% prepare a report about the effect of sample size (from 1 to 30) 
% on the sampling distribution by using figures
%

sizelim = 31;
sfile = 'my_population.xlsx';

stable= readtable(sfile);
sarr = table2array(stable(1,2:301));
% smean = mean(sarr);
[V,M] = var(sarr);
len = length(sarr);

rng('shuffle');
ssize = 1;
while ssize < sizelim
    fprintf("Sample Size: %d\n", ssize)
    rng('shuffle');
    % randomly generate indices
    indices = randperm(len,ssize);
    % print randomly generated indices 
    fprintf('random indices: [%s]\n', join(string(indices), ','));
    % randomly generate sampling distribution with sample size
    srandarr = zeros(1, length(indices));
    %fprintf('idx: [%s]\n', join(string(srandarr), ','));
    % make a randomly generated array with random indices with ssize
    for i = 1:length(indices) 
        index = indices(i);
        srandarr(i) = sarr(index); 
    end
    fprintf('random array: [%s]\n', join(string(srandarr), ','));
    % get mean and variance of the sampling distribution 
    [V,M] = var(srandarr);
    S = std(srandarr);
    fprintf("Mean: %f\n", M);
    fprintf("Standard Deviation: %f\n", S);
    fprintf("Variance: %f\n", V);
    % continue iteration
    ssize = ssize + 1;
    fprintf("--------------------------------------------------\n");
end









