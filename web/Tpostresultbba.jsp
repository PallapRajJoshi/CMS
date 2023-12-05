<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Student Results</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 0;
      background-color: #f4f4f4;
    }

    header {
      background-color: #333;
      color: #fff;
      text-align: center;
      padding: 1rem 0;
    }

    .container {
      max-width: 800px;
      margin: auto;
      padding: 20px;
      background-color: #fff;
      box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }

    select {
      width: 100%;
      padding: 10px;
      margin-bottom: 20px;
      border: 1px solid #ccc;
      border-radius: 4px;
    }

   

 

    
  </style>
</head>
<body>
  <header>
    <h1>Send Result</h1>
  </header>
  
  <div class="container">
    <label for="subselect">Select a subject:</label>
    <select id="subselect">
      <option disabled selected>Choose Subject</option>
      <option value="sub1">Subject 1</option>
      <option value="sub2">Subject 2</option>
      <option value="sub3">Subject 3</option>
      <option value="sub4">Subject 4</option>
      <option value="sub5">Subject 5</option>
    </select>

  </div>
  
  <script>
    var selectElement = document.getElementById('subselect');
    selectElement.addEventListener('change', function () {
      var selectedOption = selectElement.value;
      
      
      if (selectedOption !== "") {
          
          
        if (selectedOption === "sub1") {
          // Do something specific for Subject 1
          // For example, redirect to sub1.jsp
          window.location.href = "sub1.jsp";
        } else if (selectedOption === "sub2") {
          // Do something specific for Subject 2
          // For example, redirect to sub2.jsp
          window.location.href = "sub2.jsp";
        }
         } else if (selectedOption === "sub3") {
          // Do something specific for Subject 2
          // For example, redirect to sub2.jsp
          window.location.href = "sub3.jsp";
        }
         } else if (selectedOption === "sub4") {
          // Do something specific for Subject 2
          // For example, redirect to sub2.jsp
          window.location.href = "sub4.jsp";
        }
         } else if (selectedOption === "sub5") {
          // Do something specific for Subject 2
          // For example, redirect to sub2.jsp
          window.location.href = "sub5.jsp";
        }
      }
    });
  </script>
</body>
</html>
