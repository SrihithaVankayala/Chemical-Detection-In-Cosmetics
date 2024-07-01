<!-- <%@ page import="javax.servlet.http.*" %>
<%@ page import="javax.servlet.*" %>

<!DOCTYPE html>
<html>
<head>
    <title>Welcome</title>
</head>
<body>
    <h2>Welcome</h2>
    <%
        String userEmail = (String) session.getAttribute("userEmail");
        if (userEmail != null) {
            out.println("Welcome, " + userEmail + "!<br>");
        } else {
            response.sendRedirect("login.jsp");
        }
    %>
    <a href="ing.jsp">CLICK</a>
</body>
</html> -->
<%@ page import="javax.servlet.http.*" %>
<%@ page import="javax.servlet.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cosmetic Ingredient Input</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-image: url('https://media.istockphoto.com/id/1405351781/photo/cosmetic-smears-of-creamy-texture-on-a-pastel-beige-background.jpg?s=2048x2048&w=is&k=20&c=wRHqA9jLPoX0UTHTZHVswrqknqszGB62ZbNFFlxkibo=');
            background-size: cover;
            background-repeat: no-repeat;
        }
        h1 {
            color: #391E10;
            text-align: center;
            font-family: cursive;
        }
        form {
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        label {
            margin-top: 10px;
            font-family: cursive;
        }
        input, button {
            margin: 5px 0;
        }
        .product-list {
            display: flex;
            justify-content: space-around;
            margin-top: 20px;
        }
        .product-list div {
            width: 45%;
        }
        .product-list h2 {
            text-align: center;
            color: #391E10;
            font-family: cursive;
        }
        .product-list ul {
            list-style-type: none;
            padding: 0;
        }
        .product-list li {
            background-color: #f1f1f1;
            margin: 10px 0;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            text-align: center;
        }
        button {
            display: block;
            margin-top: 10px;
            font-family: cursive;
        }
        .nav-links {
            margin-top: 20px;
            text-align: center;
        }
        .nav-links a {
            text-decoration: none;
            color: #391E10;
            font-family: cursive;
        }
        .nav-links a:hover {
            text-decoration: underline;
        }
        #safetyMessage {
            text-align: center;
            font-family: cursive;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <%
        String userEmail = (String) session.getAttribute("userEmail");
        if (userEmail == null) {
            response.sendRedirect("login.jsp");
            return; // Ensure no further content is processed
        }
    %>
    <h1>Enter Cosmetic Ingredients</h1>
    <form id="ingredientForm">
        <label for="ingredient">Ingredient:</label>
        <input type="text" id="ingredient" name="ingredient" required>
        <button type="submit">Add Ingredient</button>
        <button type="button" id="finalizeProduct">Finalize Product</button>
    </form>

    <div class="product-list">
        <div>
            <h2>Safe Products</h2>
            <ul id="safeProductList"></ul>
        </div>
        <div>
            <h2>Unsafe Products</h2>
            <ul id="unsafeProductList"></ul>
        </div>
    </div>

    <div id="safetyMessage"></div>

    <div class="nav-links">
        <a href="homepage.html">Back to Home</a> |
        <a href="environment_impact.html">Environmental Impact</a>
    </div>

    <script>
        const harmfulChemicals = [
            'parabens', 'paraformaldehyde', 'phthalates', 'formaldehyde', 'toluene', 'lead', 'triclosan',
            'sodium lauryl sulfate', 'sodium laureth sulfate', 'polyethylene glycols', 'siloxanes',
            'coal', 'tar', 'dyes', 'butylated hydroxytoluene', 'oxybenzone',
            'propylene glycol', 'synthetic colors', 'fragrance', 'benzene', 'methylparaben', 'propylparaben', 'butylparaben', 'ethylparaben',
            'dibutyl phthalate', 'diethyl phthalate', 'quaternium-15', 'dmdm hydantoin', 'imidazolidinyl urea', 'diazolidinyl urea',
            'sodium lauryl sulphate', 'sls', 'sodium laureth sulphate', 'sles', 'toluene', 'triclosan', 'polyethylene glycols',
            'synthetic fragrances', 'coal', 'tar', ' dyes', 'p-phenylenediamine', 'bha', 'bht',
            'butylated hydroxyanisole and butylated hydroxytoluene', 'siloxanes', 'cyclomethicone', 'cyclotetrasiloxane',
            'cyclopentasiloxane', 'cyclohexasiloxane', 'dea', 'mea', 'tea', 'oxybenzone', 'glycerin', 'methylparaben', 'ethylparaben',
            'propylparaben', 'butylparaben', 'diethyl phthalate', 'dep', 'dibutyl phthalate', 'dbp', 'formaldehyde',
            'quaternium-15', 'dmdm hydantoin', 'imidazolidinyl urea', 'diazolidinyl urea', 'sodium lauryl sulfate', 'sls',
            'sodium laureth sulfate', 'sles'
        ];

        let currentProductIngredients = [];
        let isCurrentProductUnsafe = false;

        document.getElementById('ingredientForm').addEventListener('submit', function(event) {
            event.preventDefault(); // Prevent form from submitting normally
            const ingredientInput = document.getElementById('ingredient');
            const ingredient = ingredientInput.value.trim().toLowerCase();
            if (ingredient) {
                currentProductIngredients.push(ingredient);
                ingredientInput.value = ''; // Clear the input field

                // Check if the current ingredient is harmful
                if (harmfulChemicals.includes(ingredient)) {
                    isCurrentProductUnsafe = true;
                }

                // Update safety message dynamically
                const safetyMessage = document.getElementById('safetyMessage');
                safetyMessage.textContent = isCurrentProductUnsafe ? 'Warning: The product contains harmful chemicals and is unsafe.' : 'The product is safe.';
                safetyMessage.style.color = isCurrentProductUnsafe ? 'red' : 'green';
            }
        });

        document.getElementById('finalizeProduct').addEventListener('click', function() {
            if (currentProductIngredients.length > 0) {
                const productList = isCurrentProductUnsafe ? document.getElementById('unsafeProductList') : document.getElementById('safeProductList');
                const li = document.createElement('li');
                li.textContent = currentProductIngredients.join(', ');
                productList.appendChild(li);

                // Update final safety message
                const safetyMessage = document.getElementById('safetyMessage');
                safetyMessage.textContent = isCurrentProductUnsafe ? 'The product is unsafe.' : 'The product is safe.';
                safetyMessage.style.color = isCurrentProductUnsafe ? 'red' : 'green';

                // Reset current product ingredients and safety status
                currentProductIngredients = [];
                isCurrentProductUnsafe = false;
            }
        });
    </script>
</body>
</html>
