%% Reading Hot Wire Data

%% Storing calibration data
calibration_data = struct('cal_set',zeros(10,1),'calibration',zeros(1000,2)); % making empty array structures 
for i = 0:10
    calibration_set_nr = i*2 ; 
    if calibration_set_nr < 10
        filename = append('Calibration/Calibration_00', string(calibration_set_nr));
    else
        filename = append('Calibration/Calibration_0', string(calibration_set_nr));
    end
    calibration_data(i+1).calibration = dlmread(filename,'',23,0);
end

%% Storing measurement data

% making empty array structures :
aoa0_measurement_data = struct('measurement_set', zeros(21,1), 'measurements', zeros(1500,2)) ;
aoa5_measurement_data = struct('measurement_set', zeros(21,1), 'measurements', zeros(1500,2)) ;
aoa15_measurement_data = struct('measurement_set', zeros(21,1), 'measurements', zeros(1500,2)) ;

for i = 0:9 

    for j = 10:-1:0
        
        % indexing measurement sets
        measurement_set_nr = j*4 ;
        if measurement_set_nr < 10
            filename_plus = append('/Measurement_+0', string(measurement_set_nr)) ;
            filename_min  = append('/Measurement_-0', string(measurement_set_nr)) ;
        else
            filename_plus = append('/Measurement_+', string(measurement_set_nr)) ;
            filename_min  = append('/Measurement_-', string(measurement_set_nr)) ;
        end
       
        % adding measurement data to empty array structures 
        if measurement_set_nr == 0 
        else
            aoa0_measurement_data(i+1).measurements = dlmread(append('0aoa',filename_plus,'_+00'),'',23,0) ;
            aoa0_measurement_data(end-i).measurements = dlmread(append('0aoa',filename_min,'_+00'),'',23,0) ; 
            
            aoa5_measurement_data(i+1).measurements = dlmread(append('5aoa',filename_plus,'_+05'),'',23,0) ;
            aoa5_measurement_data(end-i).measurements = dlmread(append('5aoa',filename_min,'_+05'),'',23,0) ; 
            
            aoa15_measurement_data(i+1).measurements = dlmread(append('15aoa',filename_plus,'_+15'),'',23,0) ;
            aoa15_measurement_data(end-i).measurements = dlmread(append('15aoa',filename_min,'_+15'),'',23,0) ; 
        
        end
    end
        
end 

