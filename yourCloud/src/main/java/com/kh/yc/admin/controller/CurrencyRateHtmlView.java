/*
 * package com.kh.yc.admin.controller;
 * 
 * 
 * import net.sf.jasperreports.engine.*; import
 * net.sf.jasperreports.engine.data.JRBeanCollectionDataSource; import
 * net.sf.jasperreports.engine.export.HtmlExporter; import
 * net.sf.jasperreports.export.SimpleExporterInput; import
 * net.sf.jasperreports.export.SimpleHtmlExporterOutput; import
 * org.springframework.stereotype.Component; import
 * org.springframework.web.servlet.view.AbstractView;
 * 
 * import com.kh.yc.reward.model.vo.ExcelReward;
 * 
 * import javax.servlet.http.HttpServletRequest; import
 * javax.servlet.http.HttpServletResponse; import java.io.InputStream; import
 * java.util.List; import java.util.Map;
 * 
 * @Component("forexView") public class CurrencyRateHtmlView extends
 * AbstractView { private JasperReport currencyRatesReport;
 * 
 * @Override protected void renderMergedOutputModel(Map<String, Object> model,
 * HttpServletRequest request, HttpServletResponse response) throws Exception {
 * response.setContentType("text/html"); List<ExcelReward> rates =
 * (List<ExcelReward>) model.get("todayCurrencyRates"); //data source
 * JRDataSource dataSource = getDataSource(rates); //compile jrxml template and
 * get report JasperReport report = getReport(); //fill the report with data
 * source objects JasperPrint jasperPrint = JasperFillManager.fillReport(report,
 * null, dataSource); //export to html HtmlExporter exporter = new
 * HtmlExporter(DefaultJasperReportsContext.getInstance());
 * exporter.setExporterInput(new SimpleExporterInput(jasperPrint));
 * exporter.setExporterOutput(new
 * SimpleHtmlExporterOutput(response.getWriter())); exporter.exportReport(); }
 * 
 * private JRDataSource getDataSource(List<ExcelReward> rates) {
 * JRBeanCollectionDataSource dataSource = new
 * JRBeanCollectionDataSource(rates); return dataSource; }
 * 
 * public JasperReport getReport() throws JRException { if (currencyRatesReport
 * == null) {//compile only once lazily InputStream stream =
 * getClass().getResourceAsStream("/rates.jrxml"); currencyRatesReport =
 * JasperCompileManager.compileReport(stream); } return currencyRatesReport; } }
 */