<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<link rel='stylesheet' href='fonts/markdown.css'>
</head>

# Racnet

Web application using shiny to gain association rules using Aproiri algorithm within a transactional database.
<div class='container'>
<img src='interface/fruit.png' class='mx-auto d-block'/>
</div>

<div><mark>
<b>NOTE:</b></mark>
 Feel free to fork that repository ,PR are welcom as well ,and give us a shot if you like the project by starring it.
 </div>

</br>



**<p style='color:red;'>1. INTRODUCTION :</p>**
<p class="ml-2">
<b>Market Basket Analysis :</b> Technique used by large retailers to uncover associations between items . It works by looking for a combinations of items that occurs together frequently in transactions, providing information to understand the purchase behavior.
</p>
<p  class="ml-2">
First it’s important to define the Apriori algorithm, including some statistical concepts (support, confidence, lift and conviction) to select interesting rules.
</p>

**<p style='color:red;'>1. ASSOCIATION RULES :</p>**
<p class="ml-2">

<p  class="ml-2">
The Apriori algorithm generates association rules for a given data set. An association rule implies that if an item A occurs, then item B also occurs with a certain probability. Let’s see an example :
</p>

<table>
<thead>
	<tr><th></th><th scope=col>items</th></tr>
</thead>
<tbody>
	<tr><th scope=row>[1]</th><td>{BISCUIT,BREAD,MAGGI,TEA}       </td></tr>
	<tr><th scope=row>[2]</th><td>{BREAD,JAM,MAGGI,TEA}           </td></tr>
	<tr><th scope=row>[3]</th><td>{BREAD,MILK}                    </td></tr>
	<tr><th scope=row>[4]</th><td>{BISCUIT,COCK,COFFEE,CORNFLAKES}</td></tr>
	<tr><th scope=row>[5]</th><td>{BOURNVITA,COFFEE,SUGER}        </td></tr>
	<tr><th scope=row>[6]</th><td>{BREAD,COCK,COFFEE}             </td></tr>
</tbody>
</table>

<img src='interface/interface_gross/full_screen_interface.png'/>

