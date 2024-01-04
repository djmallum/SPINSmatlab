function rho = eqn_of_state_dT(t)
% Computes density of seawater at 0 pressure by the equation
% of state in Brydon et al (1999)
%
% courtesy Fluids Group UW

% Constants
c1 = -9.20601e-2;
c2 =  5.10768e-2;
c3 =  8.05999e-1;
c4 = -7.40849e-3;
c5 = -3.01036e-3;
c6 =  3.32267e-5;
c7 =  3.21931e-5;

rho = 2.*c4 + 6.*c6.*t ;
