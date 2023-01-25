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
% read raw population data from the excel file
stable= readtable(sfile);
% convert raw data into array
sarr = table2array(stable(1,2:301));
len = length(sarr);

means = zeros(1, 30);
standard_deviations = zeros(1, 30);
variances = zeros(1, 30);

[PV, PM] = var(sarr);

ssize = 1;
while ssize < sizelim
    fprintf("Sample Size: %d\n", ssize)
    rng('shuffle');
    % randomly generate indices
    indices = randperm(len,ssize);
    % print randomly generated indices 
    %fprintf('random indices: [%s]\n', join(string(indices), ','));
    % randomly generate sampling distribution with sample size
    srandarr = randsample(sarr, ssize);
    fprintf('random array: [%s]\n', join(string(srandarr), ','));
    % get mean, standard deviation, and variance of the sampling distribution 
    [V,M] = var(srandarr);
    S = std(srandarr);
    fprintf("Mean: %f\n", M);
    fprintf("Standard Deviation: %f\n", S);
    fprintf("Variance: %f\n", V);
   
    means(1,ssize) = M;
    standard_deviations(1, ssize) = S;
    variances(1, ssize) = V;
    
    %% Create a Figure
    figure;
    subplot(1,2,1);
    histogram(means);
    title('Sampling Means');
    xlabel('Mean');
    ylabel('Sample Size ' + string(ssize));

    subplot(1,2,2);
    histogram(variances);
    title('Sampling Variances');
    xlabel('Variance');
    ylabel('Sample Size ' + string(ssize));

    % Add lines for population mean and variance to histograms
    hold on;
    subplot(1,2,1);
    line([PM PM], ylim, 'Color', 'm');
    line([M M], ylim, 'Color', 'g');
    subplot(1,2,2);
    line([PV PV], ylim, 'Color', 'm');
    line([V V], ylim, 'Color', 'g');
    hold off;

    %%
    % continue iteration
    ssize = ssize + 1;
    fprintf("--------------------------------------------------\n");
end








