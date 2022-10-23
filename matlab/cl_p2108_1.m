function Ah = cl_p2108_1(f, h, type, varargin)
%cl_loss1 clutter loss according to P.2108 §3.1
%   L = cl_p2108_1(f, h, type, vargin)
%
%   This function computes the median clutter loss
%   as defined in ITU-R P.2108 (Section 3.1) using height-gain terminal
%   correction method 
%
%     Input parameters:
%     f       -   Frequency (GHz): 0.03 - 3
%     h       -   Antenna height (m)
%     type    -   Default clutter types:
%                 1 - water/sea,  R = 10 m, Equation (2b)
%                 2 - open/rural, R = 10 m, Equation (2b)
%                 3 - suburban,   R = 10 m, Equation (2a)
%                 4 - urban/trees/forest, R = 15 m, Equation (2a)
%                 5 - dense urban,R = 20 m, Equation (2a)
%     Optional input parameters:
%     vargin(1) = R  -   clutter height (m) , if local information available,
%                        overwrites the default value defined above
%     vargin(2) = ws -   street width (m) , overwrites the default value ws = 27 m
%
%
%     Output parameters:
%     Ah     -   clutter loss according to P.P2108 §3.1
%
%     Example:
%     Ah = cl_p2108_1(f, h, type)
%     Ah = cl_p2108_1(f, h, type, R)
%     Ah = cl_p2108_1(f, h, type, R, ws)

%     Rev   Date        Author                          Description
%     -------------------------------------------------------------------------------
%     v0    01MAY17     Ivica Stevanovic, OFCOM         Initial version

%% Read the input arguments and check them

if nargin > 5    warning(strcat('cl_p2108_1: Too many input arguments; The function requires at most 5',...
        'input arguments. Additional values ignored. Input values may be wrongly assigned.'));
end

if nargin <3 
    error('cl_p2108_1: function requires at least 3 input parameters.');
end

% Checking passed parameter to the defined limits

if f < 0.03 || f > 3
   warning('Frequency is outside of the valid domain [0.03, 3] GHz'); 
end


% Optional arguments
ws = 27;
R = [];

if nargin >=4
    R=varargin{1};
    if nargin >=5
        ws=varargin{2};
    end
end

if (isempty(R))
    if type == 1 || type == 2 || type == 3
        R = 10;
    elseif type == 4
        R= 15;
    elseif type == 5
        R = 20;
    else
        warning(strcat('Clutter type is not defined.', ...
                       'Setting it to default case: Suburban.'));
        R = 10;
        type = 3;
    end
end

if h >= R
    Ah = 0;
    return 
end

    Knu = 0.342*sqrt(f); % (2g)
    Kh2 = 21.8 + 6.2*log10(f); %(2f)
    hdif = R - h; %(2d)
    theta_c = atand(hdif/ws); %(2e)
    nu = Knu*sqrt(hdif*theta_c); %(2c)

if type == 1 || type == 2 
    
    Ah = -Kh2*log10(h/R); % (2b)

else
    
    if nu <= -0.78
        
        J = 0;
    
    else
        
        J = 6.9 + 20*log10(sqrt((nu-0.1).^2+1) + nu - 0.1);
        
    end
    
    Ah = J - 6.03;
end

return
end
    


