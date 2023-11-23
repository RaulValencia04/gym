<%-- 
    Document   : reportes
    Created on : 23 nov. 2023, 00:38:13
    Author     : raulvalencia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="net.sf.jasperreports.engine.*" %>
<%@ page import="net.sf.jasperreports.engine.util.JRLoader" %>
<%@ page import="net.sf.jasperreports.view.JasperViewer" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Visor de Informe</title>
</head>
<body>

<%
    // Ruta al archivo .jasper
    String jasperFilePath = getServletContext().getRealPath("/WEB-INF/Views/Rutina/report1.jasper");

    // Cargar el informe Jasper
    JasperReport jasperReport = (JasperReport) JRLoader.loadObjectFromFile(jasperFilePath);

    // Puedes pasar parámetros al informe si es necesario
    // Map<String, Object> parameters = new HashMap<>();

    // Generar el informe JasperPrint
    JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, null, new JREmptyDataSource());

    // Mostrar el informe en un visor JasperViewer
    JasperViewer.viewReport(jasperPrint, false);
%>

</body>
</html>
