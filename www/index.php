<?php
session_start();

if (isset($_SESSION["auth"]))
    header("Location: administration.php");
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link href="assets/css/index.css" rel="stylesheet" type="text/css" />
    <script src="assets/js/vue.js"></script>
    <script src="assets/js/jquery-3.1.1.min.js"></script>
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <title>HEPL Immersion</title>
</head>
    <body>
        <div id="myapp">
            <header>
                <!-- Image and text -->
                <nav class="navbar navbar-light bg-light">
                    <a class="navbar-brand" href="#">
                        <img src="assets/img/logo.png" width="50%" height="50%" class="d-inline-block align-top" alt="">
                    </a>
                    <nav class="navbar navbar-light bg-light justify-content-between">
                        <button v-if="show==1" @click.prevent="show=2" class="btn btn-outline-success my-2 my-sm-0">Administrateur</button>
                        <button v-if="show==2" @click.prevent="show=1" class="btn btn-outline-success my-2 my-sm-0">Etudiant</button>
                    </nav>
                </nav>
            </header>
            <div v-if="show == 1" class="container pt-5 pb-5">
                <form method="POST">
                    <div class="form-group">
                        <label for="mail">Email :</label>
                        <input value="kgosset10@gmail.com" type="text" class="form-control" v-model="loginForm.email" placeholder="...">
                    </div>
                    <div class="alert alert-danger " v-if="errorMessages['email']">
                        {{ errorMessages.email }}
                    </div>
                    <div class="form-group">
                        <label for="password">Mot de passe :</label>
                        <input type="password" class="form-control" v-model="loginForm.password"  placeholder="...">
                    </div>
                    <div class="alert alert-danger " v-if="'password' in errorMessages">
                        {{ errorMessages.password }}
                    </div>
                    <div class="form-group">
                        <input class="form-control btn-primary" type="button" value="Se connecter" @click="login();">
                    </div>
                </form>
            </div>
            <div v-if="show == 2 && registerStep == 1" class="container pt-5 pb-5 register">
                <form method="POST">
                    <div class="form-group">
                        <label for="mail">Email :</label>
                        <input value="kgosset10@gmail.com" type="text" class="form-control" v-model="registerForm.email">
                    </div>
                    <div class="alert alert-danger " v-if="'email' in errorMessages">
                        {{ errorMessages.email }}
                    </div>
                    <div class="form-group">
                        <label for="nom">Nom :</label>
                        <input type="text" class="form-control" v-model="registerForm.lastname">
                    </div>
                    <div class="alert alert-danger " v-if="'lastname' in errorMessages">
                        {{ errorMessages.lastname }}
                    </div>
                    <div class="form-group">
                        <label for="Prenom">Prenom :</label>
                        <input type="text" class="form-control" v-model="registerForm.firstname">
                    </div>
                    <div class="alert alert-danger " v-if="'firstname' in errorMessages">
                        {{ errorMessages.firstname }}
                    </div>
                    <div class="form-group">
                        <label for="Etablissement">Etablissements scolaire :</label>
                        <select class="form-control" id="exampleFormControlSelect1"  v-model="registerForm.id_establishment">
                            <option v-for="establishment  in establishments" :value="establishment.id" >{{ establishment.name }}</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <input type="button" class="btn btn-primary" value="Suivant" @click="sendRegisterFormPart1();" />
                    </div>
                </form>
            </div>
            <div v-if="show == 2 && registerStep == 2" class="container pt-5 pb-5 register">
                <form method="POST">
                    <div class="form-group">
                        <input type="button" class="btn btn-primary back" value="Retour" @click="registerStep=1" />
                    </div>
                    <div class="form-group">
                        <h4>Choisir une journée d'immersion</h4>
                        <select class="form-control" ref="selectImmersionDay" @change="immersionSelectionChange($event);" v-model="registerForm.id_immersion">
                            <option v-for="immersion in immersions" :value="immersion.id">{{ immersion.date }}</option>
                        </select>
                    </div>
                    <div class="funkyradio row mb-3">
                        <div class="funkyradio-primary col-xl-4">
                            <input type="checkbox" value="1" name="infoGestion" id="infoGestion" @change="sectionsSelectionChange();" v-model="sections">
                            <label for="infoGestion"><b>Info Gestion</b></label>
                        </div>
                        <div class="funkyradio-primary col-xl-4">
                            <input type="checkbox" value="2" name="infoIndustriel" id="infoIndustriel" @change="sectionsSelectionChange();" v-model="sections">
                            <label for="infoIndustriel"><b>Info Industriel</b></label>
                        </div>
                        <div class="funkyradio-primary col-xl-4">
                            <input type="checkbox" value="3" name="infoReseau" id="infoReseau" @change="sectionsSelectionChange();" v-model="sections">
                            <label for="infoReseau"><b>Info Réseau</b></label>
                        </div>
                    </div>
                    <div class="form-group" v-if="sections.length > 0">
                        <h4>Plage <span id="timeFirst">8h20/8h50</span></h4>
                        <label for="selectFirstCourse">Selectionnez le cours</label>
                        <select class="form-control" id="selectFirstCourse" @change="firstCourseSelectionChange();" v-model="registerForm.coursesSelected.first">
                            <option selected disabled>Sélectionnez un cours...</option>
                            <option v-if="course.startHour >= startHour.first && course.endHour <= endHour.first"  :value="course.id" v-for="course in courses">[{{ course.startHour }} - {{ course.endHour }}] {{ course.name }}"</option>
                        </select>
                    </div>
                    <div class="form-group" v-if="courseStep >= 2">
                        <h4>Plage <span id="timeSecond">10h30</span></h4>
                        <label for="selectSecondCourse">Selectionnez le cours</label>
                        <select class="form-control" id="selectSecondCourse" @change="secondCourseSelectionChange();"  v-model="registerForm.coursesSelected.second">
                            <option selected disabled>Sélectionnez un cours...</option>
                            <option v-if="course.startHour >= startHour.second && course.endHour <= endHour.second" :value="course.id"   v-for="course in courses">[Termine à {{ course.endHour }}] {{ course.name }}</option>
                        </select>
                    </div>
                    <div class="form-group" v-if="courseStep >= 3">
                        <h4>Plage <span id="timeThird">13h30</span></h4>
                        <label for="selectThirdCourse">Selectionnez le cours</label>
                        <select class="form-control" id="selectThirdCourse" @change="thirdCourseSelectionChange();" v-model="registerForm.coursesSelected.third"  >
                            <option selected disabled>Sélectionnez un cours...</option>
                            <option v-if="course.startHour >= startHour.third && course.endHour <= endHour.third"v-bind="{ thirdcourseendhour: course.endHour }" :value="course.id"   v-for="course in courses">[Termine à {{ course.endHour }}] {{ course.name }}</option>
                        </select>
                    </div>
                    <div class="form-group" v-if="courseStep >= 4">
                        <h4>Plage <span id="timeFourth">{{ thirdCourseEndHour }}</span></h4>
                        <label for="selectFourthCourse">Selectionnez le cours</label>
                        <select class="form-control" id="selectFourthCourse" @change="fourthCourseSelectionChange();" v-model="registerForm.coursesSelected.fourth">
                            <option selected disabled>Sélectionnez un cours...</option>
                            <option v-if="course.startHour >= thirdCourseEndHour && course.endHour <= endHour.fourth" :value="course.id"   v-for="course in courses">[{{ course.startHour }} - {{ course.endHour }}] {{ course.name }}</option>
                        </select>
                    </div>
                    <div class="form-group" v-if="courseStep >= 5">
                        <input type="button" class="btn btn-primary" value="Suivant" @click="sendRegisterFormPart2();" />
                    </div>
                </form>
            </div>
        </div>
        <script src="assets/js/indexScript.js"></script>
    </body>
</html>