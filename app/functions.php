<?php

/** Dédale de fonctions plus ou moins pratiques **/

// Retourn l'ip de l'utilisateur
function IM_getIp()
{
    if (isset($_SERVER["HTTP_CLIENT_IP"])) { // IP si internet partagé
        return $_SERVER["HTTP_CLIENT_IP"];
    } elseif (isset($_SERVER["HTTP_X_FORWARDED_FOR"])) { // IP derrière un proxy
        return $_SERVER["HTTP_X_FORWARDED_FOR"];
    } elseif (isset($_SERVER["REMOTE_ADDR"])) { // IP classique
        return $_SERVER["REMOTE_ADDR"];
    }
    return null;
}

// Retourne un "s" lorsque $n est différent de 1
function IM_plural($n)
{
    if (is_numeric($n)) {
        $n = IM_secure($n, "int");
        if ($n != 1) {
            return "s";
        }
    }
    return null;
}

/**
 * Vérifie si le paramètre est un nombre strictement positif
 *
 * @param mixed $n
 * @return bool
 */
function IM_isNumericStrictlyPositive($n)
{
    $secure = IM_secure($n, 'float');
    return (is_numeric($n) && $secure !== false && $secure > 0);
}

/**
 * Vérifie si le paramètre est un nombre positif
 *
 * @param mixed $n
 * @return bool
 */
function IM_isNumericPositive($n)
{
    $secure = IM_secure($n, 'float');
    return (is_numeric($n) && $secure !== false && $secure >= 0);
}

/**
 * Vérifie si le paramètre n'est pas une chaîne de caractères vide
 *
 * @param mixed $s
 * @return bool
 */
function IM_isNotEmptyString($s)
{
    return (is_string($s) && !empty(trim($s)));
}

// Génère une chaine de caractère aléatoire de la taille demandée parmis les caractères listés
// De: Brad Christie (modifiée)
// http://stackoverflow.com/questions/5438760/generate-random-5-characters-string
function IM_getToken($len = 50)
{
    if (IM_isNumericStrictlyPositive($len)) {
        $len = IM_secure($len, "int");
    } else {
        return null;
    }

    // Eviter les caractères spéciaux (peut causer des soucis dans l'URL)
    $c = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ01234567890123456789";
    $s = str_split($c);
    shuffle($s);
    $r = "";
    foreach (array_rand($s, $len) as $k) $r .= $s[$k];
    return $r;
}

// Conversion de dates
function IM_formatDate($timestamp)
{
    $date = date('Y-m-d H:i:s', $timestamp);
    $parts = explode(" ", $date);
    $paramsDay = explode("-", $parts[0]);
    $paramsHour = explode(":", $parts[1]);
    $dateObj = \DateTime::createFromFormat('!m', $paramsDay[1]);

    $nmeng = ["january", "february", "march", "april", "may", "june", "july", "august", "september", "october", "november", "december"];
    $nmfr = ["janvier", "février", "mars", "avril", "mai", "juin", "juillet", "août", "septembre", "octobre", "novembre", "décembre"];
    $month = str_ireplace($nmeng, $nmfr, $dateObj->format("F"));
    return ["day" => $paramsDay[2], "month" => $month, "year" => $paramsDay[0], "hour" => $paramsHour[0], "minute" => $paramsHour[1], "second" => $paramsHour[2]];
}

// Retourne une date comme "15 avril 2017" selon le timestamp envoyé
function IM_getDate($timestamp)
{
    $timestamp = IM_secure($timestamp, "int");
    $data = IM_formatDate("string", $timestamp);
    return $data["day"] . " " . $data["month"] . " " . $data["year"];
}

// Vérifie si une date est valide selon le format indiqué
// Voir la doc PHP pour les format de date
function IM_isDateValid($date, $format = "j-n-Y")
{
    $d = \DateTime::createFromFormat($format, $date);
    return $d && $d->format($format) == $date;
}

// Vérifie si une chaîne de caractères peut-être transformée en JSON
function IM_isJson($string) {
    json_decode($string);
    return (json_last_error() == JSON_ERROR_NONE);
}

// Sécurise une chaine de caractère (pas 100% sûre, mais intéressante et jamais eu de soucis jusqu'ici)
function IM_secure($var, $type = "string", $hardness = "hard")
{
    if (is_string($type) && is_string($hardness)) {
        if(($type === "int" || $type === "float") && trim($var) === "") {
            return false;
        } else {
            switch ($hardness) {
                case "low":
                    $var = strval(trim(htmlentities($var)));
                    break;
                default:
                    $var = strval(trim(htmlentities(strip_tags($var))));
                    break;
            }
            if ($type === "int") {
                $var = intval($var);
            } elseif ($type === "float") {
                $var = floatval($var);
            }
            return $var;
        }
    }
    return null;
}

// Retourne une chaîne de caractère
// Utile que dans le include/head.php
function IM_getGFontsAsString($fonts)
{
    $str = null;
    foreach ($fonts as $font) $str .= $font."|";
    return substr($str, 0, -1);
}

// Retourne l'année limite d'inscription
/* Exemple:
 * Age minimum: 13ans
 * Année actuelle: 2019
 * Retourne: 2019 - 13 = 2006 => année de naissance minimum pour s'inscrire
 */
function IM_getMinimalAgeYear($age)
{
    if (is_numeric($age)) {
        $age = IM_secure($age, "int");

        $actualYear = intval(date("Y"));
        return $actualYear - $age;
    }
    return null;
}

// Retourne 0 si le $num est inférieur à 0, sinon retourne $num sans le modifier
function IM_subZero($num)
{
    if (is_numeric($num)) {
        $num = IM_secure($num, "float");
        return ($num < 0) ? 0 : $num;
    }
    return null;
}

// Retourne la page actuelle selon l'url (?p=5 retourne 5, ?p=-3 retourne 1)
function IM_getPage($key = "p")
{
    if (is_string($key) && !empty(trim($key))) {
        $page = (!empty($_GET[$key])) ? IM_secure($_GET[$key], "int") : 1;
        return (!is_numeric($page) || $page < 1) ? 1 : intval($page);
    }
    return 0;
}

// Transforme une chaîne de caractère en un slug
/* Exemple
 * Mon titre d'article: "La fête de la Nouvelle Année !"
 * Retourne: "la-fete-de-la-nouvelle-annee"
 */
function IM_slug($string)
{
    if (is_string($string) && !empty(trim($string))) {
        $string = trim($string);

        // replace non letter or digits by -
        $string = preg_replace("#[^\pL\d]+#u", "-", $string);

        // transliterate
        $string = iconv("utf-8", "us-ascii//TRANSLIT", $string);

        // remove unwanted characters
        $string = preg_replace("#[^-\w]+#", "", $string);

        // trim
        $string = trim($string, "-");

        // remove duplicate -
        $string = preg_replace("#-+#", "-", $string);

        // lowercase
        $string = strtolower($string);

        return $string;
    }
    return null;
}

function IM_sql($sql, $params, $dataGiven = [])
{
    if (IM_isNotEmptyString($sql) && is_array($params) && is_array($dataGiven)) {
        global $conn;

        $sql = trim($sql);

        $data = ["fetch" => true, "single" => false];
        if (!empty($dataGiven)) {
            foreach ($dataGiven as $key => $value) {
                if (in_array($key, $data)) $data[$key] = $dataGiven[$key];
            }
        }

        $stmt = mysqli_stmt_init($conn);
        if (!mysqli_stmt_prepare($stmt, $sql)) {
            return false;
        } else {
            if (is_array($params) && !empty($params)) {
                $array = [$stmt, $params["types"]];
                foreach ($params["values"] as $k => $value) {
                    $array[] = &$params["values"][$k];
                }
                call_user_func_array("mysqli_stmt_bind_param", $array);
            }

            if (mysqli_stmt_execute($stmt)) {
                if ($data["fetch"]) {
                    $result = mysqli_stmt_get_result($stmt);
                    if ($data["single"]) {
                        $data = mysqli_fetch_assoc($result);
                    } else {
                        $data = mysqli_fetch_all($result, MYSQLI_ASSOC);
                    }
                    if (!empty($data)) {
                        return $data;
                    }
                }
            } else {
                return false;
            }
            return null;
        }
    }
    return false;
}

function IM_isLogged()
{
    return (isset($_SESSION["auth"]));
}

function IM_getBonusBoost()
{
    if (IM_isLogged()) {
        $grade = 1;
        $jc = $_SESSION["auth"]["joursConsecutifs"];
        if ($jc > 6) {
            $grade = 6;
        } elseif ($jc > 1) {
            $grade = $jc;
        }
        return (0.8 + ($grade * 0.2));
    }
}

function IM_resetGameSession()
{
    if (IM_isLogged()) {
        $_SESSION["auth"]["game"] = [
            "isPlaying" => false,
            "isEnded" => false,
            "idTheme" => -1,
            "stage" => 0,
            "questionsId" => [],
            "suffledAnswers" => [],
            "currentQuestion" => [],
            "currentQuestionSelectionned" => false,
            "timestampQuestionAsked" => 0,
            "totalPointsTheme" => 0,
            "totalPointsPartie" => 0,
            "titlesList" => [],
            "newTitles" => []
        ];
    }
}

function IM_prettyVD($var)
{
    return "<pre>" . var_export($var, true) . "</pre>";
}
