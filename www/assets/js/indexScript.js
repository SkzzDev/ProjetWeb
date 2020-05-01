function countKeys(object) {
    return Object.keys(object).length;
}

var app = new Vue({
    el: '#myapp',
    data: {
        loginForm: {
            email: "",
            password:"",
        },
        registerForm: {
            firstname: "",
            lastname: "",
            email: "",
            id_establishment:"",
            id_immersion:"",
            coursesSelected: {
                first: -1,
                second: -1,
                third: -1,
                fourth: -1
            },
        },
        errorMessages: {},
        establishments: [],
        courses: [],
        startHour: {
            first: "08h20",
            second: "10h30",
            third: "13h30",
            fourth: "15h30"
        },
        endHour: {
            first: "10h30",
            second: "13h30",
            third: "15h30",
            fourth: "17h30"
        },
        sections: [],
        immersions: [],
        courseStep: 1,
        thirdCourseEndHour: "",
        show: 2,
        registerStep: 1,

    },
    computed:{
        containsKeyEmail(){
            return this.containsKeyAll(this.errorMessages, 'email');
        }
    },
    methods: {
        containsKeyAll(obj, key ) {
            return Object.keys(obj).includes(key);
        },
        checkFirstName: function (firstname) {
            var firstnamePattern = /^[a-zA-Z ]{2,45}$/;
            if (!firstname) {
                this.errorMessages.firstname = "Veuillez entrer un nom.";
            } else if (!(firstnamePattern.test(firstname))) {
                this.errorMessages.firstname = "Veuillez entrer un prenom valide.";
            }else{
                delete this.errorMessages.firstname;
            }
        },
        checkLastName: function (lastname) {
            var LastnamePattern = /^[a-zA-Z ]{2,45}$/;
            if (!lastname) {
                this.errorMessages.lastname = "Veuillez entrer un nom.";
            } else if (!(LastnamePattern.test(lastname))) {
                this.errorMessages.lastname = "Veuillez entrer un nom valide.";
            }else{
                delete this.errorMessages.lastname;
            }
        },
        checkPassword: function (password) {
            if (!password) {
                this.errorMessages.password = "Veuillez entrer un mot de passe.";
            } else {
                delete this.errorMessages.password;
            }
        },
        checkEmail: function (email) {
            var emailPattern = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
            if (!email) {
                this.errorMessages.email = "Veuillez entrer une adresse email.";
            } else if (!(emailPattern.test(email))) {
                this.errorMessages.email = "Veuillez encoder un format d'email valide";
            } else {
                if(email.length > 3 && email.length <= 45){
                this.errorMessages.email = "";
                delete this.errorMessages.email;
                }else{
                    this.errorMessages.email = "L'email est trop longue";
                }
            }
        },
        allEstablishments: function () {
            axios.post('../app/axiosRequests/index.php', {
                request: "getAllEstablishments",
            })
            .then(function (response) {
                app.establishments = response.data;
            })
            .catch(function (error) {
                 console.log(error);
            });
        },
        allCourses: function (id_immersion) {
            axios.post('../app/axiosRequests/index.php', {
                request: "allCourses",
                id_immersion: id_immersion,
                sections: this.sections
            })
            .then(function (response) {
                app.courses = response.data;
            })
            .catch(function (error) {
                console.log(error);
            });
        },
        allImmersions: function () {
            axios.post('../app/axiosRequests/index.php', {
                request: "allImmersions",
            })
            .then(function (response) {
                app.immersions = response.data;
            })
            .catch(function (error) {
                console.log(error);
            });
        },
        login: function () {
            this.checkEmail(this.loginForm.email);
            this.checkPassword(this.loginForm.password);
            if (countKeys(this.errorMessages) === 0) {
                axios.post('../app/axiosRequests/index.php', {
                    request: "login",
                    password: this.loginForm.password,
                    email: this.loginForm.email,
                })
                .then(function (response) {
                    if (countKeys(response.data) === 0) {
                        window.location = "administration.php";
                    } else {
                        for(let propertyName in response.data) {
                            app.errorMessages[propertyName] = response.data[propertyName];
                        }
                    }
                })
                .catch(function (error) {
                    console.log(error);
                });
            }
        },
        immersionSelectionChange: function(event) {
            let id = event.target.selectedIndex + 1;
            this.allCourses(id);
        },
        sectionsSelectionChange: function() {
            let id = this.$refs.selectImmersionDay.selectedIndex + 1;
            this.allCourses(id);
        },
        firstCourseSelectionChange: function() {
            if (this.courseStep < 2) this.courseStep = 2;
        },
        secondCourseSelectionChange: function() {
            if (this.courseStep < 3) this.courseStep = 3;
        },
        thirdCourseSelectionChange: function() {
            if (this.courseStep < 4) this.courseStep = 4;
            this.thirdCourseEndHour = $("#selectThirdCourse").find(":selected").attr("thirdcourseendhour");
            $("#timeFourth").text(this.thirdCourseEndHour);
        },

        fourthCourseSelectionChange: function() {
            if (this.courseStep < 5) this.courseStep = 5;
        },
        sendRegisterFormPart1: function () {
            this.checkEmail(this.registerForm.email);
            this.checkLastName(this.registerForm.lastname);
            this.checkFirstName(this.registerForm.firstname);
            if (countKeys(this.errorMessages) === 0) {
                axios.post('../app/axiosRequests/index.php', {
                    request: "emailExist",
                    email: this.registerForm.email,

                })
                .then(function (response) {
                    if (countKeys(response.data) === 1) {
                        // Ajout des erreurs à la table errorMessages
                            app.errorMessages.email = response.data.email;
                    }else{
                            app.registerStep = 2;
                    }
                })
                .catch(function (error) {
                    console.log(error);
                });
            }
        },
        sendRegisterFormPart2: function () {
            if (countKeys(this.errorMessages) === 0) {
                axios.post('../app/axiosRequests/index.php', {
                    request: "register",
                    registerForm: this.registerForm,
                })
                .then(function (response) {
                    console.log(response.data);

                     if (typeof response.data === 'string'){
                         console.log(response.data);
                     }

                     else if (countKeys(response.data) === 0) {
                         console.log(countKeys(response.data));
                     } else {
                         // Ajout des erreurs à la table errorMessages
                         for(let propertyName in response.data) {
                             app.errorMessages[propertyName] = response.data[propertyName];
                         }
                     }

                })
                .catch(function (error) {
                    console.log(error);
                });
            }
        }
    },
    created: function () {
        this.allEstablishments();
        this.allImmersions();
    },
});
