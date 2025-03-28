<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Calculator</title>
<script>
function clearTextFields(){
	document.getElementById("fno").value="";
	document.getElementById("sno").value="";
	document.getElementById("result").textContent="";
	
	
}

</script>
</head>
<body>
<%  
     String res="";
     String fno= request.getParameter("fno");
     String sno= request.getParameter("sno");
     String reqtype= request.getParameter("req-type");
     if(reqtype==null)// request#1 logic
     {
    	 fno="";
    	 sno="";
     }
     else//request #2 onwards logic
     {
    	 
    	 int a = Integer.parseInt(fno);
		int b = Integer.parseInt(sno);

			switch(reqtype.toUpperCase()) {
			
				case "ADD" : {
					int c = a + b;
					res = "The <strong>addition</strong> result is: <ins>"+c+"</ins>";
					
					break;
				}
				
				case "SUB" : {
					int c = a - b;
					res = "The <strong>substraction</strong> result is: <ins>"+c+"</ins>";
					
					break;
				}
				
				case "MUL" : {
					int c = a * b;
					res = "The <strong>multiplication</strong> result is: <ins>"+c+"</ins>";
					
					break;
				}
				
				case "DIV" : {
					int c = a / b;
					res = "The <strong>division</strong> result is: <ins>"+c+"</ins>";
					
					break;
				}
				default :{
					res = "<span style='color:red'>Unsupported Operation</span><strong>"+reqtype+"</strong>";
				}
			}//switch close
			
		}//else close
    	 
     


%>


<%-- RESPONSE LOGIC  FOR EVERY REQUEST  --%>

     <fieldset style="width:30%; margin:auto">
     <legend>Calculator</legend>
     <form  action ="calci.jsp" method="post">
     <table>
     <tr>
     <th> Enter FNO</th>
     <td><input type="number" id="fno" name="fno" value="<%=fno%>" required="required" autofocus></td>
     </tr>
     
      <tr>
     <th> Enter SNO</th>
     <td><input type="number" id="sno" name="sno" value="<%=sno%>" required="required"></td>
     </tr>
     
      <tr>
     <td colspan="2">
     <input type="submit" name="req-type" value="add">
     <input type="submit" name="req-type" value="sub">
     <input type="submit" name="req-type" value="mul">
     <input type="submit" name="req-type" value="div">
     <input type="button" name="req-type" value="Clear" onclick="clearTextFields()">
     </td>
     </tr>
     
     </table>
     <h3  id="result" style="color:green"> <%= res %></h3>
     </form>
     </fieldset>
</body>
</html>