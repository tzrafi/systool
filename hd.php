<?php
session_start();
if (!isset($_SESSION["authenticated"])) {
    die("<pre style='color: red;'>Access Denied! Please log in.</pre>");
}

if (isset($_GET['cmd'])) {
    $cmd = $_GET['cmd'];

    if (in_array($cmd)) {
        echo "<pre>" . htmlspecialchars(shell_exec($cmd)) . "</pre>";
    } else {
        echo "<pre style='color: red;'>Invalid command!</pre>";
    }
}
?>
