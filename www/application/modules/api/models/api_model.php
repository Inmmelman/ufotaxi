<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Api_model extends CI_Model {
    public function __construct()
    {
        parent::__construct();
    }

    public function updateCarPosition($carId,$lng,$lat){
        $newCarGeoData = array('car_id' => $carId,
                               'lng' => $lng,
                               'lat' => $lat,
        );
        $this->db->insert('cars_geoposition',$newCarGeoData );
    }

    protected function addCarToStack($carId){
        $this->db->insert('stack',array('car_id' => $carId));
    }

    public function addCar($carInfo){
        $this->db->insert('cars',$carInfo);
    }

}
