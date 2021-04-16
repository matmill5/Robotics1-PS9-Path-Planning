%get model for payload

function [payload_ctr_pts,payload_radii] = get_payload_collision_model (q_vec,a_vec)
  payload_length=1.2;
  payload_width = 0.1;
%   payload_ctr_pt = [a_vec(1)*cos(q_vec(1))+a_vec(2)*cos(q_vec(1)+q_vec(2)); a_vec(1)*sin(q_vec(1))+a_vec(2)*sin(q_vec(1)+q_vec(2))];
  payload_left_pt = [a_vec(1)*cos(q_vec(1))+a_vec(2)*cos(q_vec(1)+q_vec(2))+0.6*cos(q_vec(1)+q_vec(2)+pi/2); a_vec(1)*sin(q_vec(1))+a_vec(2)*sin(q_vec(1)+q_vec(2))+0.6*sin(q_vec(1)+q_vec(2)+pi/2)];
  payload_right_pt = [a_vec(1)*cos(q_vec(1))+a_vec(2)*cos(q_vec(1)+q_vec(2))+0.6*cos(q_vec(1)+q_vec(2)-pi/2); a_vec(1)*sin(q_vec(1))+a_vec(2)*sin(q_vec(1)+q_vec(2))+0.6*sin(q_vec(1)+q_vec(2)-pi/2)];
 
  
  payload_ctr_pts=[]; %FIX ME!
  payload_circle_radius = payload_width/2;
  payload_radii=[]; %fill this with payload_width/2 for each sample point
  
  n_circles_payload = round(payload_length*2/payload_circle_radius);

  x_vals = linspace(payload_left_pt(1),payload_right_pt(1),n_circles_payload);
  y_vals = linspace(payload_left_pt(2),payload_right_pt(2),n_circles_payload);
  
  payload_ctr_pts = [x_vals;y_vals];
  payload_radii = ones(1,n_circles_payload).*payload_circle_radius;
end
