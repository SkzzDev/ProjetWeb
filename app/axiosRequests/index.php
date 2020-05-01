<?php

include "../config/config.php";
include "../functions.php";

session_start();

$data = json_decode(file_get_contents("php://input"));

$request = $data->request;

// Fetch All records
if ($request == "getAllEstablishments") {
    $query = mysqli_query($con,"select  * from establishments");

    // Fetch toutes les données d'un coup sous forme d'un tableau
    $establishments = mysqli_fetch_all($query, MYSQLI_ASSOC);

    echo json_encode($establishments);

} elseif ($request == "allCourses") {
    $sectionsIds = "";
    foreach ($data->sections as $k => $id) {
        $sectionsIds .= $id . ",";
    }
    $sectionsIds = substr($sectionsIds, 0, -1);
    
    $sql = "
    SELECT c.id, c.name, CONCAT(DATE_FORMAT(cp.startHour, '%H'), 'h', DATE_FORMAT(cp.startHour, '%i')) as startHour, CONCAT(DATE_FORMAT(cp.endHour, '%H'), 'h', DATE_FORMAT(cp.endHour, '%i')) as endHour, cs.id_section
    FROM courses c
        INNER JOIN courses_programmation cp ON (cp.id_course = c.id)
        INNER JOIN courses_sections cs ON (cs.id_course = c.id)
        INNER JOIN immersions i on (i.id = " . $data->id_immersion . ")
    WHERE cp.day = DATE_FORMAT(i.date, '%w') AND cs.id_section IN (" . $sectionsIds . ")";
    $query = mysqli_query($con, $sql);
    
    // Fetch toutes les données d'un coup sous forme d'un tableau
    $courses = mysqli_fetch_all($query, MYSQLI_ASSOC);
    
    echo json_encode($courses);
    
} elseif ($request == "allImmersions") {
    
    $sql = "SELECT id, date FROM immersions;";
    $query = mysqli_query($con, $sql);
    
    // Fetch toutes les données d'un coup sous forme d'un tableau
    $immersions = mysqli_fetch_all($query, MYSQLI_ASSOC);
    
    foreach ($immersions as $k => $immersion) {
        $dateInfos = IM_formatDate(strtotime($immersion["date"]));
        $immersions[$k]["date"] = $dateInfos["day"] . " " . $dateInfos["month"] . " " . $dateInfos["year"];
    }
    
    echo json_encode($immersions);
    
} elseif ($request == "login") {
    
    $errorMessages = [];
    
    $query = mysqli_query($con,"SELECT * FROM users WHERE email = '" . $data->email . "'");
    if (mysqli_num_rows($query) == 0) {
        $errorMessages["email"] = "Cette adresse email n'est associée à aucun compte.";
    } else {
        $user = mysqli_fetch_assoc($query);
        if (password_verify($data->password, $user["password"])) {
            unset($user["password"]);
            $_SESSION["auth"] = $user;
        } else {
            $errorMessages["password"] = "Le mot de passe est incorrect.";
        }
    }
    
    echo json_encode($errorMessages);
    
} elseif ($request == "register") {

    try{


    $errorMessages = [];

    // Vérifs à faire

    $registerForm = $data->registerForm;




    $query = mysqli_query($con,"SELECT * FROM students WHERE email = '".$registerForm->email."'");
    if (mysqli_num_rows($query) == 0) {
        //insert
        $sql = "INSERT INTO students(firstname,lastname,email,id_immersion,id_establishment) VALUES ('".$registerForm->firstname."','".$registerForm->lastname."','".$registerForm->email."',".intval($registerForm->id_immersion).",".intval($registerForm->id_establishment).")";
        $query = mysqli_query($con, $sql);

        var_dump($sql);

        $query = mysqli_query($con,"SELECT id FROM students WHERE email = '".$registerForm->email."'");
        $user = mysqli_fetch_assoc($query);

        foreach ($registerForm->coursesSelected as $k => $id_course) {
        $sql = "INSERT INTO students_courses(id_student,id_course) VALUES (".intval($user['id']).",".intval($id_course).")";
        $query = mysqli_query($con, $sql);
        }

        var_dump($sql);


    }else{
        $errorMessages["email"] = "Cette adresse email est déjà associée à un compte.";
    }

    // Si erreur: $errorMessages["nom_du_champ"] = "msg";

    echo json_encode($errorMessages);

    }catch(Exception $e){
        var_dump($e);
    }

} elseif ($request == "emailExist") {

    $errorMessages = [];


    $query = mysqli_query($con,"SELECT * FROM students WHERE email = '".$data->email."'");
    if (mysqli_num_rows($query) != 0) {
        $errorMessages["email"] = "Cette adresse email est déjà associée à un compte.";
    }

    echo json_encode($errorMessages);
}
