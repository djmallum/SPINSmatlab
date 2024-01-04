function rho = eqn_of_state2(t)
% Computes density of seawater at 0 pressure by the equation
% of state in Brydon et al (1999)
%
% courtesy Fluids Group UW

% Constants
c0 = -0.134999999999991;
c1 =  5.84e-2;
c2 =  -7.45e-3;
c3 = 3.30e-5;

rho = c0 + c1.*t + c2.*t.^2 + c3.*t.^3;
