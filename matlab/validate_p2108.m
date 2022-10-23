% This script validates the implementation of Recommendation ITU-R
% P.P2108 against the reference values produced by Clutter and BEL
% workbook made available on the SG3 Software and Dataset web page.

%     Rev   Date        Author                          Description
%     -------------------------------------------------------------------------------
%     v0    01MAY17     Ivica Stevanovic, OFCOM         Initial version
%     v1    15JUL21     Ivica Stevanovic, OFCOM         Aligned to ITU-R P.2108-1 

errtol = 0.01;

% flag: print to SEAMCAT java format
seamcat = 0;

% test 1: cl_loss1

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
    fprintf(1,'cl_loss1: test 1 passed\n');
else
    fprintf(1, 'cl_loss1: test 1 failed, error: %f\n',err);
end

if (seamcat == 1)
    fprintf(1,'@Test\n');
    fprintf(1, 'public void test1() {\n');
    
    fprintf(1,'P2108ver1 calculator = new P2108ver1();\n');
    
    fprintf(1,'double f = %f;\n', f);
    fprintf(1,'double h = %f;\n', h);
    fprintf(1,'double ws = %f;\n', ws);
    fprintf(1,'double R = %f;\n', R);
    fprintf(1,'int eqnum = %d;\n', eqnum);
    
    fprintf(1,'double expectedResult = %f;\n', Ah_ref);
    
    fprintf(1,'double result = calculator.cl_loss1(f, h, eqnum, R, ws);\n');
    fprintf(1,'util.assertDoubleEquals(expectedResult, result);\n');
    fprintf(1,'}\n');
end

% cl_loss1: test 2
type = 1;
eqnum = 2;
R = 4;
Ah = cl_p2108_1(f, h, type, R, ws);
Ah_ref = 6.9;

err = abs(Ah-Ah_ref);
if err < errtol
    fprintf(1,'cl_loss1: test 2 passed\n');
else
    fprintf(1, 'cl_loss1: test 2 failed, error: %f\n',err);
end
if (seamcat == 1)
    fprintf(1,'@Test\n');
    fprintf(1, 'public void test2() {\n');
    
    fprintf(1,'P2108ver1 calculator = new P2108ver1();\n');
    
    fprintf(1,'double f = %f;\n', f);
    fprintf(1,'double h = %f;\n', h);
    fprintf(1,'double ws = %f;\n', ws);
    fprintf(1,'double R = %f;\n', R);
    fprintf(1,'int eqnum = %d;\n', eqnum);
    
    fprintf(1,'double expectedResult = %f;\n', Ah_ref);
    
    fprintf(1,'double result = calculator.cl_loss1(f, h, eqnum, R, ws);\n');
    fprintf(1,'util.assertDoubleEquals(expectedResult, result);\n');
    fprintf(1,'}\n');
end
%%
% cl_loss1: test 3
type = 2;
R= 10;
eqnum = 2;

Ah = cl_p2108_1(f, h, type);
Ah_ref = 16;
err = abs(Ah-Ah_ref);
if err < errtol
    fprintf(1,'cl_loss1: test 3 passed\n');
else
    fprintf(1, 'cl_loss1: test 3 failed, error: %f\n',err);
end
if (seamcat == 1)
    fprintf(1,'@Test\n');
    fprintf(1, 'public void test3() {\n');
    
    fprintf(1,'P2108ver1 calculator = new P2108ver1();\n');
    
    fprintf(1,'double f = %f;\n', f);
    fprintf(1,'double h = %f;\n', h);
    fprintf(1,'double ws = %f;\n', ws);
    fprintf(1,'double R = %f;\n', R);
    fprintf(1,'int eqnum = %d;\n', eqnum);
    
    fprintf(1,'double expectedResult = %f;\n', Ah_ref);
    
    fprintf(1,'double result = calculator.cl_loss1(f, h, eqnum, R, ws);\n');
    fprintf(1,'util.assertDoubleEquals(expectedResult, result);\n');
    fprintf(1,'}\n');
end


%% cl_loss1: test 4

R = 4;
Ah = cl_p2108_1(f, h, type, R, ws);
Ah_ref = 6.9;

err = abs(Ah-Ah_ref);
if err < errtol
    fprintf(1,'cl_loss1: test 4 passed\n');
else
    fprintf(1, 'cl_loss1: test 4 failed, error: %f\n',err);
end
if (seamcat == 1)
    fprintf(1,'@Test\n');
    fprintf(1, 'public void test4() {\n');
    
    fprintf(1,'P2108ver1 calculator = new P2108ver1();\n');
    
    fprintf(1,'double f = %f;\n', f);
    fprintf(1,'double h = %f;\n', h);
    fprintf(1,'double ws = %f;\n', ws);
    fprintf(1,'double R = %f;\n', R);
    fprintf(1,'int eqnum = %d;\n', eqnum);
    
    fprintf(1,'double expectedResult = %f;\n', Ah_ref);
    
    fprintf(1,'double result = calculator.cl_loss1(f, h, eqnum, R, ws);\n');
    fprintf(1,'util.assertDoubleEquals(expectedResult, result);\n');
    fprintf(1,'}\n');
end

%%
% cl_loss1: test 5
type = 3;
eqnum = 1;
R = 10;
Ah = cl_p2108_1(f, h, type);
Ah_ref = 20.45;
err = abs(Ah-Ah_ref);
if err < errtol
    fprintf(1,'cl_loss1: test 5 passed\n');
else
    fprintf(1, 'cl_loss1: test 5 failed, error: %f\n',err);
end
if (seamcat == 1)
    fprintf(1,'@Test\n');
    fprintf(1, 'public void test5() {\n');
    
    fprintf(1,'P2108ver1 calculator = new P2108ver1();\n');
    
    fprintf(1,'double f = %f;\n', f);
    fprintf(1,'double h = %f;\n', h);
    fprintf(1,'double ws = %f;\n', ws);
    fprintf(1,'double R = %f;\n', R);
    fprintf(1,'int eqnum = %d;\n', eqnum);
    
    fprintf(1,'double expectedResult = %f;\n', Ah_ref);
    
    fprintf(1,'double result = calculator.cl_loss1(f, h, eqnum, R, ws);\n');
    fprintf(1,'util.assertDoubleEquals(expectedResult, result);\n');
    fprintf(1,'}\n');
end

% cl_loss1: test 6

R = 4;
Ah = cl_p2108_1(f, h, type, R, ws);
Ah_ref = 9.24;

err = abs(Ah-Ah_ref);
if err < errtol
    fprintf(1,'cl_loss1: test 6 passed\n');
else
    fprintf(1, 'cl_loss1: test 6 failed, error: %f\n',err);
end
if (seamcat == 1)
    fprintf(1,'@Test\n');
    fprintf(1, 'public void test6() {\n');
    
    fprintf(1,'P2108ver1 calculator = new P2108ver1();\n');
    
    fprintf(1,'double f = %f;\n', f);
    fprintf(1,'double h = %f;\n', h);
    fprintf(1,'double ws = %f;\n', ws);
    fprintf(1,'double R = %f;\n', R);
    fprintf(1,'int eqnum = %d;\n', eqnum);
    
    fprintf(1,'double expectedResult = %f;\n', Ah_ref);
    
    fprintf(1,'double result = calculator.cl_loss1(f, h, eqnum, R, ws);\n');
    fprintf(1,'util.assertDoubleEquals(expectedResult, result);\n');
    fprintf(1,'}\n');
end
%%
% cl_loss1: test 7
type = 4;
eqnum = 1;
R = 15;
Ah = cl_p2108_1(f, h, type);
Ah_ref = 24.5;
err = abs(Ah-Ah_ref);
if err < errtol
    fprintf(1,'cl_loss1: test 7 passed\n');
else
    fprintf(1, 'cl_loss1: test 7 failed, error: %f\n',err);
end
if (seamcat == 1)
    fprintf(1,'@Test\n');
    fprintf(1, 'public void test7() {\n');
    
    fprintf(1,'P2108ver1 calculator = new P2108ver1();\n');
    
    fprintf(1,'double f = %f;\n', f);
    fprintf(1,'double h = %f;\n', h);
    fprintf(1,'double ws = %f;\n', ws);
    fprintf(1,'double R = %f;\n', R);
    fprintf(1,'int eqnum = %d;\n', eqnum);
    
    fprintf(1,'double expectedResult = %f;\n', Ah_ref);
    
    fprintf(1,'double result = calculator.cl_loss1(f, h, eqnum, R, ws);\n');
    fprintf(1,'util.assertDoubleEquals(expectedResult, result);\n');
    fprintf(1,'}\n');
end

%% cl_loss1: test 8

R = 4;
Ah = cl_p2108_1(f, h, type, R, ws);
Ah_ref = 9.24;

err = abs(Ah-Ah_ref);
if err < errtol
    fprintf(1,'cl_loss1: test 8 passed\n');
else
    fprintf(1, 'cl_loss1: test 8 failed, error: %f\n',err);
end
if (seamcat == 1)
    fprintf(1,'@Test\n');
    fprintf(1, 'public void test8() {\n');
    
    fprintf(1,'P2108ver1 calculator = new P2108ver1();\n');
    
    fprintf(1,'double f = %f;\n', f);
    fprintf(1,'double h = %f;\n', h);
    fprintf(1,'double ws = %f;\n', ws);
    fprintf(1,'double R = %f;\n', R);
    fprintf(1,'int eqnum = %d;\n', eqnum);
    
    fprintf(1,'double expectedResult = %f;\n', Ah_ref);
    
    fprintf(1,'double result = calculator.cl_loss1(f, h, eqnum, R, ws);\n');
    fprintf(1,'util.assertDoubleEquals(expectedResult, result);\n');
    fprintf(1,'}\n');
end
%%
% cl_loss1: test 9
type = 5;
eqnum = 1;
R =20;
Ah = cl_p2108_1(f, h, type);
Ah_ref = 27.1;
err = abs(Ah-Ah_ref);
if err < errtol
    fprintf(1,'cl_loss1: test 9 passed\n');
else
    fprintf(1, 'cl_loss1: test 9 failed, error: %f\n',err);
end
if (seamcat == 1)
    fprintf(1,'@Test\n');
    fprintf(1, 'public void test9() {\n');
    
    fprintf(1,'P2108ver1 calculator = new P2108ver1();\n');
    
    fprintf(1,'double f = %f;\n', f);
    fprintf(1,'double h = %f;\n', h);
    fprintf(1,'double ws = %f;\n', ws);
    fprintf(1,'double R = %f;\n', R);
    fprintf(1,'int eqnum = %d;\n', eqnum);
    
    fprintf(1,'double expectedResult = %f;\n', Ah_ref);
    
    fprintf(1,'double result = calculator.cl_loss1(f, h, eqnum, R, ws);\n');
    fprintf(1,'util.assertDoubleEquals(expectedResult, result);\n');
    fprintf(1,'}\n');
end

% cl_loss1: test 10

R = 4;
Ah = cl_p2108_1(f, h, type, R, ws);
Ah_ref = 9.24;

err = abs(Ah-Ah_ref);
if err < errtol
    fprintf(1,'cl_loss1: test 10 passed\n');
else
    fprintf(1, 'cl_loss1: test 10 failed, error: %f\n',err);
end

if (seamcat == 1)
    fprintf(1,'@Test\n');
    fprintf(1, 'public void test10() {\n');
    
    fprintf(1,'P2108ver1 calculator = new P2108ver1();\n');
    
    fprintf(1,'double f = %f;\n', f);
    fprintf(1,'double h = %f;\n', h);
    fprintf(1,'double ws = %f;\n', ws);
    fprintf(1,'double R = %f;\n', R);
    fprintf(1,'int eqnum = %d;\n', eqnum);
    
    fprintf(1,'double expectedResult = %f;\n', Ah_ref);
    
    fprintf(1,'double result = calculator.cl_loss1(f, h, eqnum, R, ws);\n');
    fprintf(1,'util.assertDoubleEquals(expectedResult, result);\n');
    fprintf(1,'}\n');
end
%% cl_loss2

clear d p f

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

success = find(abs(round(Lctt,1)-Lctt_ref)<errtol);

fprintf(1, 'cl_loss2: %d out of %d tests passed.\n', numel(success), numel(Lctt));
if(seamcat== 1)
    fprintf(1,'@Test\n');
    fprintf(1, 'public void test11() {\n');
    
    fprintf(1,'P2108ver1 calculator = new P2108ver1();\n');
    
    
    fprintf(1,'double[] p = new double[%d];\n', length(p));
    fprintf(1,'double[] f = new double[%d];\n', length(f));
    fprintf(1,'double d = %f;\n', d);
    
    for pi = 1:length(p)
        fprintf(1,'p[%d] = %f;\n', pi-1, p(pi));
    end
    
    for fi = 1:length(f)
        fprintf(1,'f[%d] = %f;\n', fi-1, f(fi));
    end
    
    fprintf(1,'double[] expectedResult = new double[%d];\n', numel(Lctt));
    count = 0;
    
    for pi = 1:length(p)
        for fi = 1:length(f)
            fprintf(1,'expectedResult[%d] = %f;\n', count, Lctt(fi,pi));
            count = count + 1;
        end
    end
    
    fprintf(1,'int count = 0;\n');
    fprintf(1,'for (int pi = 0; pi < %d; pi++) {\n', length(p));
    fprintf(1,'for (int fi = 0; fi < %d; fi++) {\n', length(f));
    fprintf(1,'double result = calculator.cl_loss2(f[fi],d,p[pi]);\n');
    fprintf(1,'util.assertDoubleEquals(expectedResult[count], result);\n');
    fprintf(1,'count = count + 1;\n');
    fprintf(1,'}\n');
    fprintf(1,'}\n');
    fprintf(1,'}\n');
end



%% cl_loss3

clear p th f

f = 30;
p = [0.1 1:1:99 99.9];
th = [0	5	10	15	20	30	40	50	60	70	80	90	2];

Lces_ref = [-1.02	-1.74	-1.97	-2.08	-2.15	-2.21	-2.22	-2.21	-2.18	-2.12	-2.03	-1.85	-1.45
    3.42	0.90	0.07	-0.37	-0.66	-1.00	-1.20	-1.33	-1.41	-1.45	-1.46	-1.40	1.95
    6.02	2.36	1.13	0.47	0.05	-0.47	-0.78	-0.98	-1.12	-1.21	-1.26	-1.23	3.88
    8.00	3.44	1.91	1.08	0.55	-0.11	-0.50	-0.76	-0.94	-1.06	-1.14	-1.13	5.34
    9.68	4.35	2.55	1.57	0.95	0.18	-0.28	-0.59	-0.80	-0.95	-1.04	-1.05	6.57
    11.16	5.14	3.10	2.00	1.29	0.42	-0.10	-0.45	-0.69	-0.86	-0.97	-0.99	7.65
    12.51	5.85	3.60	2.38	1.59	0.63	0.05	-0.33	-0.59	-0.78	-0.90	-0.93	8.63
    13.75	6.51	4.05	2.72	1.87	0.81	0.19	-0.22	-0.51	-0.71	-0.84	-0.89	9.54
    14.92	7.12	4.47	3.04	2.12	0.98	0.31	-0.13	-0.43	-0.65	-0.79	-0.84	10.38
    16.02	7.69	4.86	3.33	2.35	1.14	0.42	-0.04	-0.37	-0.59	-0.75	-0.80	11.18
    17.07	8.24	5.24	3.61	2.57	1.29	0.53	0.04	-0.30	-0.54	-0.71	-0.77	11.94
    18.08	8.76	5.59	3.88	2.77	1.42	0.63	0.11	-0.25	-0.50	-0.67	-0.74	12.66
    19.05	9.26	5.93	4.13	2.97	1.55	0.72	0.18	-0.19	-0.45	-0.63	-0.70	13.36
    19.99	9.74	6.25	4.37	3.16	1.68	0.81	0.24	-0.14	-0.41	-0.60	-0.68	14.03
    20.90	10.21	6.57	4.60	3.34	1.80	0.89	0.31	-0.09	-0.37	-0.56	-0.65	14.68
    21.78	10.66	6.87	4.82	3.51	1.91	0.97	0.37	-0.05	-0.34	-0.53	-0.62	15.32
    22.64	11.10	7.17	5.04	3.68	2.02	1.05	0.42	0.00	-0.30	-0.50	-0.60	15.93
    23.49	11.53	7.45	5.25	3.84	2.12	1.12	0.48	0.04	-0.27	-0.47	-0.57	16.54
    24.31	11.95	7.73	5.46	4.00	2.22	1.19	0.53	0.08	-0.23	-0.45	-0.55	17.13
    25.12	12.36	8.01	5.66	4.15	2.32	1.26	0.58	0.12	-0.20	-0.42	-0.53	17.71
    25.92	12.76	8.27	5.85	4.30	2.42	1.33	0.63	0.15	-0.17	-0.40	-0.50	18.27
    26.70	13.15	8.54	6.04	4.45	2.51	1.39	0.67	0.19	-0.14	-0.37	-0.48	18.83
    27.47	13.54	8.79	6.23	4.59	2.60	1.45	0.72	0.23	-0.12	-0.35	-0.46	19.38
    28.24	13.93	9.05	6.41	4.73	2.69	1.52	0.77	0.26	-0.09	-0.32	-0.44	19.93
    28.99	14.30	9.30	6.59	4.87	2.78	1.58	0.81	0.29	-0.06	-0.30	-0.42	20.46
    29.73	14.68	9.54	6.77	5.00	2.87	1.63	0.85	0.33	-0.03	-0.28	-0.40	20.99
    30.47	15.05	9.79	6.95	5.14	2.95	1.69	0.89	0.36	-0.01	-0.26	-0.39	21.51
    31.20	15.41	10.03	7.12	5.27	3.03	1.75	0.93	0.39	0.02	-0.24	-0.37	22.03
    31.92	15.77	10.26	7.29	5.40	3.11	1.80	0.97	0.42	0.04	-0.22	-0.35	22.55
    32.64	16.13	10.50	7.46	5.53	3.19	1.86	1.01	0.45	0.07	-0.20	-0.33	23.06
    33.36	16.49	10.73	7.63	5.65	3.27	1.91	1.05	0.48	0.09	-0.18	-0.31	23.56
    34.07	16.84	10.96	7.79	5.78	3.35	1.96	1.09	0.51	0.11	-0.16	-0.30	24.06
    34.77	17.19	11.19	7.96	5.90	3.43	2.02	1.13	0.54	0.14	-0.14	-0.28	24.56
    35.47	17.54	11.42	8.12	6.02	3.51	2.07	1.16	0.57	0.16	-0.12	-0.26	25.06
    36.17	17.88	11.64	8.28	6.15	3.58	2.12	1.20	0.59	0.18	-0.10	-0.25	25.56
    36.87	18.23	11.87	8.44	6.27	3.66	2.17	1.24	0.62	0.20	-0.08	-0.23	26.05
    37.57	18.57	12.09	8.60	6.39	3.73	2.22	1.27	0.65	0.22	-0.06	-0.22	26.54
    38.26	18.91	12.31	8.76	6.51	3.80	2.27	1.31	0.67	0.25	-0.04	-0.20	27.03
    38.95	19.26	12.54	8.92	6.62	3.88	2.32	1.34	0.70	0.27	-0.03	-0.18	27.52
    39.65	19.60	12.76	9.08	6.74	3.95	2.36	1.38	0.73	0.29	-0.01	-0.17	28.01
    40.34	19.94	12.98	9.23	6.86	4.02	2.41	1.41	0.75	0.31	0.01	-0.15	28.50
    41.03	20.28	13.20	9.39	6.98	4.09	2.46	1.44	0.78	0.33	0.03	-0.14	28.99
    41.73	20.62	13.42	9.55	7.09	4.16	2.51	1.48	0.80	0.35	0.04	-0.12	29.48
    42.42	20.96	13.64	9.70	7.21	4.23	2.55	1.51	0.83	0.37	0.06	-0.11	29.97
    43.11	21.30	13.86	9.86	7.33	4.30	2.60	1.55	0.86	0.39	0.08	-0.09	30.46
    43.81	21.64	14.08	10.01	7.44	4.38	2.65	1.58	0.88	0.41	0.10	-0.08	30.95
    44.51	21.98	14.30	10.17	7.56	4.45	2.69	1.61	0.91	0.43	0.11	-0.06	31.44
    45.21	22.33	14.52	10.33	7.67	4.52	2.74	1.64	0.93	0.45	0.13	-0.05	31.93
    45.91	22.67	14.74	10.48	7.79	4.59	2.79	1.68	0.96	0.47	0.15	-0.03	32.43
    46.62	23.01	14.96	10.64	7.91	4.66	2.83	1.71	0.98	0.49	0.16	-0.02	32.92
    47.33	23.36	15.18	10.79	8.02	4.73	2.88	1.74	1.00	0.51	0.18	0.00	33.42
    48.05	23.71	15.41	10.95	8.14	4.80	2.93	1.78	1.03	0.53	0.20	0.02	33.93
    48.77	24.06	15.63	11.11	8.25	4.87	2.97	1.81	1.05	0.55	0.21	0.03	34.43
    49.49	24.41	15.86	11.27	8.37	4.94	3.02	1.84	1.08	0.57	0.23	0.05	34.94
    50.22	24.76	16.08	11.43	8.49	5.01	3.06	1.87	1.10	0.59	0.25	0.06	35.45
    50.95	25.12	16.31	11.59	8.61	5.08	3.11	1.91	1.13	0.61	0.27	0.08	35.96
    51.69	25.48	16.54	11.75	8.73	5.15	3.16	1.94	1.15	0.63	0.28	0.09	36.48
    52.44	25.84	16.77	11.91	8.85	5.22	3.20	1.97	1.18	0.65	0.30	0.11	37.01
    53.19	26.20	17.00	12.07	8.97	5.29	3.25	2.00	1.20	0.67	0.32	0.12	37.54
    53.95	26.57	17.24	12.24	9.09	5.36	3.30	2.04	1.23	0.69	0.33	0.14	38.07
    54.72	26.94	17.47	12.40	9.21	5.44	3.34	2.07	1.25	0.71	0.35	0.15	38.61
    55.50	27.32	17.71	12.57	9.33	5.51	3.39	2.10	1.28	0.73	0.37	0.17	39.15
    56.29	27.70	17.95	12.74	9.45	5.58	3.44	2.14	1.30	0.75	0.39	0.18	39.70
    57.08	28.08	18.20	12.91	9.58	5.66	3.49	2.17	1.33	0.77	0.40	0.20	40.26
    57.89	28.47	18.44	13.08	9.71	5.73	3.54	2.20	1.35	0.79	0.42	0.22	40.83
    58.71	28.87	18.69	13.25	9.83	5.81	3.58	2.24	1.38	0.81	0.44	0.23	41.40
    59.54	29.27	18.95	13.43	9.96	5.88	3.63	2.27	1.41	0.83	0.46	0.25	41.98
    60.39	29.67	19.20	13.61	10.09	5.96	3.68	2.31	1.43	0.86	0.48	0.26	42.57
    61.25	30.08	19.46	13.79	10.23	6.04	3.73	2.34	1.46	0.88	0.49	0.28	43.17
    62.12	30.50	19.73	13.97	10.36	6.12	3.79	2.38	1.49	0.90	0.51	0.30	43.78
    63.01	30.93	20.00	14.16	10.50	6.20	3.84	2.42	1.51	0.92	0.53	0.31	44.41
    63.92	31.37	20.27	14.35	10.64	6.28	3.89	2.45	1.54	0.94	0.55	0.33	45.04
    64.85	31.81	20.55	14.54	10.78	6.36	3.94	2.49	1.57	0.97	0.57	0.35	45.69
    65.80	32.26	20.84	14.74	10.92	6.45	4.00	2.53	1.60	0.99	0.59	0.37	46.35
    66.76	32.72	21.13	14.94	11.07	6.53	4.05	2.57	1.63	1.01	0.61	0.39	47.02
    67.76	33.20	21.43	15.15	11.22	6.62	4.11	2.60	1.65	1.04	0.63	0.40	47.71
    68.77	33.68	21.73	15.36	11.37	6.71	4.17	2.64	1.68	1.06	0.65	0.42	48.42
    69.82	34.18	22.04	15.58	11.53	6.80	4.22	2.68	1.72	1.09	0.67	0.44	49.15
    70.90	34.69	22.37	15.80	11.69	6.89	4.28	2.73	1.75	1.11	0.70	0.46	49.90
    72.01	35.22	22.70	16.02	11.85	6.99	4.34	2.77	1.78	1.14	0.72	0.48	50.67
    73.15	35.77	23.04	16.26	12.02	7.09	4.41	2.81	1.81	1.16	0.74	0.50	51.47
    74.34	36.33	23.39	16.50	12.20	7.19	4.47	2.86	1.85	1.19	0.77	0.53	52.30
    75.57	36.91	23.75	16.75	12.38	7.29	4.54	2.90	1.88	1.22	0.79	0.55	53.15
    76.85	37.52	24.13	17.01	12.57	7.40	4.61	2.95	1.92	1.25	0.82	0.57	54.04
    78.18	38.15	24.53	17.28	12.76	7.51	4.68	3.00	1.95	1.28	0.84	0.60	54.97
    79.58	38.81	24.94	17.56	12.97	7.63	4.75	3.05	1.99	1.31	0.87	0.62	55.94
    81.05	39.50	25.37	17.86	13.18	7.75	4.83	3.11	2.03	1.34	0.90	0.65	56.96
    82.60	40.23	25.82	18.17	13.40	7.88	4.91	3.16	2.08	1.38	0.93	0.68	58.03
    84.24	41.01	26.30	18.50	13.64	8.02	5.00	3.22	2.12	1.42	0.96	0.70	59.17
    85.98	41.83	26.81	18.85	13.89	8.16	5.09	3.28	2.17	1.45	1.00	0.74	60.38
    87.86	42.71	27.36	19.22	14.16	8.31	5.18	3.35	2.22	1.50	1.03	0.77	61.68
    89.89	43.66	27.95	19.62	14.45	8.48	5.29	3.42	2.27	1.54	1.07	0.80	63.08
    92.10	44.70	28.59	20.06	14.76	8.65	5.40	3.50	2.33	1.59	1.11	0.84	64.62
    94.55	45.85	29.30	20.54	15.10	8.85	5.52	3.58	2.39	1.64	1.16	0.89	66.31
    97.31	47.14	30.10	21.08	15.49	9.07	5.66	3.68	2.46	1.70	1.21	0.93	68.21
    100.47	48.61	31.00	21.69	15.93	9.31	5.81	3.78	2.55	1.76	1.27	0.99	70.40
    104.20	50.35	32.07	22.42	16.44	9.60	5.99	3.91	2.64	1.84	1.34	1.05	72.98
    108.84	52.51	33.39	23.31	17.07	9.96	6.21	4.06	2.76	1.94	1.42	1.13	76.17
    115.05	55.39	35.15	24.49	17.92	10.43	6.51	4.26	2.91	2.06	1.53	1.23	80.45
    124.98	59.97	37.94	26.36	19.24	11.16	6.96	4.57	3.14	2.26	1.71	1.40	87.28
    153.43	73.00	45.82	31.60	22.91	13.18	8.20	5.43	3.80	2.81	2.20	1.85	106.78
    ];


for pi = 1: length(p)
    for ti = 1:length(th)
        Lces(pi,ti)=cl_p2108_3(f,th(ti),p(pi));
    end
end

success = find(abs(Lces-Lces_ref)<errtol);

fprintf(1, 'cl_loss3: %d out of %d tests passed.\n', numel(success), numel(Lces));
if (seamcat == 1)
    fprintf(1,'@Test\n');
    fprintf(1, 'public void test12() {\n');
    
    fprintf(1,'P2108ver1 calculator = new P2108ver1();\n');
    
    
    fprintf(1,'double[] p = new double[%d];\n', length(p));
    fprintf(1,'double[] th = new double[%d];\n', length(th));
    fprintf(1,'double f = %f;\n', f);
    
    
    for pi = 1:length(p)
        fprintf(1,'p[%d] = %f;\n', pi-1, p(pi));
    end
    
    for fi = 1:length(th)
        fprintf(1,'th[%d] = %f;\n', fi-1, th(fi));
    end
    
    fprintf(1,'double[] expectedResult = new double[%d];\n', numel(Lces));
    count = 0;
    
    for pi = 1:length(p)
        for fi = 1:length(th)
            fprintf(1,'expectedResult[%d] = %f;\n', count, Lces(pi,fi));
            count = count + 1;
        end
    end
    
    fprintf(1,'int count = 0;\n');
    fprintf(1,'for (int pi = 0; pi < %d; pi++) {\n', length(p));
    fprintf(1,'for (int fi = 0; fi < %d; fi++) {\n', length(th));
    fprintf(1,'double result = calculator.cl_loss3(f,th[fi],p[pi]);\n');
    fprintf(1,'util.assertDoubleEquals(expectedResult[count], result);\n');
    fprintf(1,'count = count + 1;\n');
    fprintf(1,'}\n');
    fprintf(1,'}\n');
    fprintf(1,'}\n');
end

