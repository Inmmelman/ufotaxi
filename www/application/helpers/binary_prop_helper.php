<?php
function getBinaryMaskHelper($dataArray){
    /*
             * binary mask
             */
    $requirementsBits = array(
        'air_conditioning' => 1,
        'child_seat'       => 2,
        'for_smokers'      => 4,
        'transport_animals' => 8
    );

    $carsRequirements = 0;

    // TODO :  wtf array

    if(is_array($dataArray)){
        foreach($dataArray as $key => $car_requirement){
            $carsRequirements += $requirementsBits[$key];
        }
    }

    return $carsRequirements;
}