% This script validates the implementation of Recommendation ITU-R
% P.P2108 against the reference values produced by Clutter and BEL
% workbook made available on the SG3 Software and Dataset web page.

%     Rev   Date        Author                          Description
%     -------------------------------------------------------------------------------
%     v0    01MAY17     Ivica Stevanovic, OFCOM         Initial version
%     v1    15JUL21     Ivica Stevanovic, OFCOM         Aligned to ITU-R P.2108-1
%     v2    15JUL25     Ivica Stevanovic, OFCOM         Introduced validation for draft Revision ITU-R P.2108-2


errtol = 0.01;

fprintf(1,'\n validation of cl_p2108_1\n');
%% cl_p2108_1: test1

f = 1.5;
h = 2;
ws = 27;
type = 1;
eqnum = 2;
R = 10;
Ah = cl_p2108_1(f, h, type);
Ah_ref = 16;
err = abs(Ah-Ah_ref);
if err < errtol
    fprintf(1,'test 1 passed\n');
else
    fprintf(1, 'test 1 failed, error: %f\n',err);
end


%% cl_p2108_1: test 2
type = 1;
eqnum = 2;
R = 4;
Ah = cl_p2108_1(f, h, type, R, ws);
Ah_ref = 6.9;

err = abs(Ah-Ah_ref);
if err < errtol
    fprintf(1,'test 2 passed\n');
else
    fprintf(1, 'test 2 failed, error: %f\n',err);
end

%% cl_p2108_1: test 3
type = 2;
R= 10;
eqnum = 2;

Ah = cl_p2108_1(f, h, type);
Ah_ref = 16;
err = abs(Ah-Ah_ref);
if err < errtol
    fprintf(1,'test 3 passed\n');
else
    fprintf(1, 'test 3 failed, error: %f\n',err);
end


%% cl_p2108_1: test 4

R = 4;
Ah = cl_p2108_1(f, h, type, R, ws);
Ah_ref = 6.9;

err = abs(Ah-Ah_ref);
if err < errtol
    fprintf(1,'test 4 passed\n');
else
    fprintf(1, 'test 4 failed, error: %f\n',err);
end


%% cl_p2108_1: test 5

type = 3;
eqnum = 1;
R = 10;
Ah = cl_p2108_1(f, h, type);
Ah_ref = 20.45;
err = abs(Ah-Ah_ref);
if err < errtol
    fprintf(1,'test 5 passed\n');
else
    fprintf(1, 'test 5 failed, error: %f\n',err);
end

%% cl_p2108_1: test 6

R = 4;
Ah = cl_p2108_1(f, h, type, R, ws);
Ah_ref = 9.24;

err = abs(Ah-Ah_ref);
if err < errtol
    fprintf(1,'test 6 passed\n');
else
    fprintf(1, 'test 6 failed, error: %f\n',err);
end

%% cl_p2108_1: test 7

type = 4;
eqnum = 1;
R = 15;
Ah = cl_p2108_1(f, h, type);
Ah_ref = 24.5;
err = abs(Ah-Ah_ref);
if err < errtol
    fprintf(1,'test 7 passed\n');
else
    fprintf(1, 'test 7 failed, error: %f\n',err);
end

%% cl_p2108_1: test 8

R = 4;
Ah = cl_p2108_1(f, h, type, R, ws);
Ah_ref = 9.24;

err = abs(Ah-Ah_ref);
if err < errtol
    fprintf(1,'test 8 passed\n');
else
    fprintf(1, 'test 8 failed, error: %f\n',err);
end

%% cl_p2108_1: test 9

type = 5;
eqnum = 1;
R =20;
Ah = cl_p2108_1(f, h, type);
Ah_ref = 27.1;
err = abs(Ah-Ah_ref);
if err < errtol
    fprintf(1,'test 9 passed\n');
else
    fprintf(1, 'test 9 failed, error: %f\n',err);
end

%% cl_p2108_1: test 10

R = 4;
Ah = cl_p2108_1(f, h, type, R, ws);
Ah_ref = 9.24;

err = abs(Ah-Ah_ref);
if err < errtol
    fprintf(1,'test 10 passed\n');
else
    fprintf(1, 'test 10 failed, error: %f\n',err);
end


%% cl_p2108_2

clear d p f

fprintf(1,'\n validation of cl_p2108_2\n')
d = 0.65;
p = [5, 50, 95, 99.9];
f = 2:66;

Lctt_ref = [    19.2	27.1	34.6	40.4
    20.0	28.3	36.3	42.1
    20.5	29.1	37.5	43.3
    20.8	29.6	38.3	44.2
    21.1	29.9	38.8	44.7
    21.3	30.2	39.1	45.0
    21.4	30.4	39.3	45.2
    21.6	30.5	39.4	45.3
    21.7	30.6	39.5	45.3
    21.8	30.7	39.5	45.4
    21.9	30.8	39.6	45.4
    22.0	30.8	39.6	45.4
    22.1	30.9	39.6	45.4
    22.2	31.0	39.6	45.4
    22.3	31.0	39.6	45.4
    22.4	31.1	39.6	45.4
    22.5	31.1	39.6	45.4
    22.5	31.1	39.6	45.4
    22.6	31.2	39.6	45.4
    22.6	31.2	39.6	45.4
    22.7	31.2	39.6	45.4
    22.7	31.3	39.6	45.4
    22.8	31.3	39.6	45.4
    22.8	31.3	39.6	45.4
    22.9	31.4	39.6	45.4
    22.9	31.4	39.6	45.4
    23.0	31.4	39.6	45.4
    23.0	31.4	39.6	45.4
    23.1	31.5	39.6	45.4
    23.1	31.5	39.6	45.4
    23.1	31.5	39.6	45.4
    23.2	31.5	39.6	45.4
    23.2	31.5	39.6	45.4
    23.2	31.6	39.6	45.4
    23.3	31.6	39.6	45.4
    23.3	31.6	39.6	45.4
    23.3	31.6	39.6	45.4
    23.3	31.6	39.6	45.4
    23.4	31.6	39.6	45.4
    23.4	31.7	39.6	45.4
    23.4	31.7	39.6	45.4
    23.5	31.7	39.6	45.4
    23.5	31.7	39.6	45.4
    23.5	31.7	39.6	45.4
    23.5	31.7	39.6	45.4
    23.6	31.7	39.6	45.4
    23.6	31.8	39.6	45.4
    23.6	31.8	39.6	45.4
    23.6	31.8	39.6	45.4
    23.6	31.8	39.6	45.4
    23.7	31.8	39.6	45.4
    23.7	31.8	39.6	45.4
    23.7	31.8	39.6	45.4
    23.7	31.8	39.6	45.4
    23.7	31.8	39.6	45.4
    23.8	31.8	39.6	45.4
    23.8	31.9	39.6	45.4
    23.8	31.9	39.6	45.4
    23.8	31.9	39.6	45.4
    23.8	31.9	39.6	45.4
    23.8	31.9	39.6	45.4
    23.9	31.9	39.6	45.4
    23.9	31.9	39.6	45.4
    23.9	31.9	39.6	45.4
    23.9	31.9	39.6	45.4
    ];

for pi = 1: length(p)
    for fi = 1:length(f)
        Lctt(fi,pi)=cl_p2108_2(f(fi),d,p(pi));
    end
end

success = find(abs(round(10*Lctt)/10-Lctt_ref)<errtol);

fprintf(1, '%d out of %d tests passed.\n', numel(success), numel(Lctt));

%% cl_p2108_3

% Progress bar header
fprintf(1,'\n validation of cl_p2108_3\n')
fprintf(1,'0%%----------100%%\n  ');

Y = readcsv('validation_examples/validation_example_p2108_3.csv');
[nrows, ncols] = size(Y);
Lces_ref = zeros(nrows,1);
Lces = zeros(nrows,1);

for i = 1:nrows
    fGHz   = str2double(Y(i,1));
    theta  = str2double(Y(i,2));
    p      = str2double(Y(i,3));
    h      = str2double(Y(i,4));
    hm     = str2double(Y(i,5));
    Lces_ref(i) = str2double(Y(i,6));
    Lces(i) = cl_p2108_3(fGHz,theta,p,h,hm);

    % Progress bar update
    if mod(i, floor(nrows/10)) == 0
        fprintf(1,'.');
    end
end

success = find( abs( Lces-Lces_ref ) <= errtol );

fprintf(1, '\n %d out of %d tests passed.\n', numel(success), numel(Lces));

clear success

%% tl_p2108_3_2ray
fprintf(1,'\n validation of tl_p2108_3_2ray\n')
filename = 'validation_examples/validation_example_tl_p2108_3_2ray.csv';
Y = readcsv(filename);
[nrows, ncols] = size(Y);
Lt = zeros(nrows,1);
sigma = zeros(nrows,1);
L = zeros(nrows,1);

fid = fopen(filename, "r");
header = fgetl(fid);
fclose(fid);
dummy = regexp(header,',','split');
Ntot = str2double(dummy(end));

Lt_tol = 2.5;
sigma_tol = 0.5;
% Progress bar header
fprintf(1,'0%%----------100%%\n  ');
fGHz   = str2double(Y(:,1));
theta  = str2double(Y(:,2));
h      = str2double(Y(:,3));
hm     = str2double(Y(:,4));
Gt_cld = str2double(Y(:,5));
Gt_clg = str2double(Y(:,6));
Gr     =  str2double(Y(:,7));
Lb     =  str2double(Y(:,8));
Lt_ref = str2double(Y(:,9));
sigma_ref = str2double(Y(:,10));

for i = 1:nrows

    L = zeros(Ntot,1);

    for ii = 1:Ntot

        p = 100*rand;

        L(ii) = tl_p2108_3_2ray(fGHz(i), theta(i), p, h(i), hm(i), Gt_cld(i), Gt_clg(i), Gr(i), Lb(i));

    end

    %[f,x] = ecdf(L);

    % Compute 10, 50 and 90 percentiles of total transmission loss
    %Lt(i,1) = interp1(linspace(0, 1, size(x,1)), sort(x), 10/100);
    %Lt(i) = interp1(linspace(0, 1, size(x,1)), sort(x), 50/100);
    %Lt(i,3) = interp1(linspace(0, 1, size(x,1)), sort(x), 90/100);
    Lt(i) = median(L);
    sigma(i) = std(L);

    % Progress bar update
    if mod(i, floor(nrows/10)) == 0
        fprintf(1,'.');
    end

end

success = find( (abs( Lt-Lt_ref ) <= Lt_tol ) & (abs(sigma-sigma_ref) <= sigma_tol) );

fprintf(1, '\n %d out of %d tests passed.\n', numel(success), nrows);

