scheme = "Linearization.zcos";

// Root Locus

// Define complex variable
s = poly(0, 's');

// Transfer function linearized G(s) = 1/(s-2)
G = syslin('c', 1/(s - 2));

// Integral controller - from requirement
C = 1/s;

// Plot root locus with integral controller
show_window(1);
evans(G*C);

// Choose PI - zero in -10
C = (0.1*s + 1)/s;

// Plot root locus with PI
show_window(2);
evans(G*C);

// Choose k = 439
C = 439*(0.1*s + 1)/s;

// Plot Nyquist with margins
show_window(3);
show_margins(G*C, 'nyquist');

// Linearization in x = 0 G(s) = 1/s
G = syslin('c', 1/s);

// Plot Nyquist with margins
show_window(4);
show_margins(G*C, 'nyquist');

// Import model
importXcosDiagram(scheme);
// Parameters
ctx = ["kp = 0.1; ki = 1; k = 439;"];
scs_m.props.context = ctx;
// Simulate
xcos_simulate(scs_m, 4);

// Draw
show_window(5);
subplot(211);
h = plot(y_out.time, y_out.values, 'b-', r_out.time, r_out.values, 'r--', 'LineWidth',3);
l = legend("Response", "Setpoint");
l.font_size = 3;
ax=gca();
set(gca(),"grid",[1 1]);
xlabel('Time [s]', 'font_style', 'times bold', 'font_size', 3);

subplot(212);
h = plot(u_out.time, u_out.values, 'b-', 'LineWidth',3);
l = legend("Control input");
l.font_size = 3;
ax=gca();
set(gca(),"grid",[1 1]);
xlabel('Time [s]', 'font_style', 'times bold', 'font_size', 3);


