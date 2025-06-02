<!DOCTYPE html>
<html>
<head>
  <title>Hacked!!</title>
  <script>
    function openPopups() {
      const messages = [
        "Ohho Naimul Hoilo na 🤣",
        "Kire Naimul.. Kono Lav nai 😋",
        "Kisu Korte parla?? 😁",
        "Ami to jani tmi parba na! 😜😜"
      ];

      const popups = [];
      let x = 0;

      for (let i = 0; i < 20; i++) {
        const msg = messages[i % messages.length];
        const top = 100 + (i * 30) % 600; // staggered vertical position

        const popup = window.open("", `popup${i}`, `width=300,height=200,left=0,top=${top},resizable=no`);
        if (popup) {
          popup.document.write(`
            <html>
              <head><title>Message ${i + 1}</title></head>
              <body style="font-family:sans-serif; display:flex; align-items:center; justify-content:center; height:100%; text-align:center;">
                <h2>${msg}</h2>
              </body>
            </html>
          `);
          popups.push({ win: popup, top });
        }
      }

      // Animate horizontally
      const moveInterval = setInterval(() => {
        try {
          x = (x + 10) % (screen.availWidth - 320);
          for (const { win, top } of popups) {
            if (!win.closed) {
              win.moveTo(x, top);
            }
          }
        } catch (e) {
          clearInterval(moveInterval);
          console.log("Stopped movement due to error:", e.message);
        }
      }, 100);
    }
  </script>
</head>
<body>
<h1> Your Website Has been Hacked!! Kire naimul.. Hoilo? Parla kisu?? Site Thik korte cao? </h1>
  <button onclick="openPopups()" style="font-size:20px; padding:12px 24px;">Click to Trigger 50 Popups</button>
</body>
</html>
