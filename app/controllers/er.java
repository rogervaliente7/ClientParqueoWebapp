// /*
//  * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
//  * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
//  */
// package sv.edu.ues.occ.ingenieria.prn335.parqueo.parqueowebapp.app.boundary.rest;

// import com.google.gson.Gson;
// import jakarta.inject.Inject;
// import jakarta.json.Json;
// import jakarta.json.JsonArray;
// import jakarta.json.JsonObject;
// import jakarta.json.JsonValue;
// import jakarta.ws.rs.Consumes;
// import jakarta.ws.rs.DELETE;
// import jakarta.ws.rs.DefaultValue;
// import jakarta.ws.rs.GET;
// import jakarta.ws.rs.POST;
// import jakarta.ws.rs.PUT;
// import jakarta.ws.rs.Path;
// import jakarta.ws.rs.PathParam;
// import jakarta.ws.rs.Produces;
// import jakarta.ws.rs.QueryParam;
// import jakarta.ws.rs.core.Context;
// import jakarta.ws.rs.core.MediaType;
// import jakarta.ws.rs.core.Response;
// import jakarta.ws.rs.core.UriInfo;
// import java.io.Serializable;
// import java.net.URI;
// import java.util.ArrayList;
// import java.util.List;
// import java.util.logging.Level;
// import java.util.logging.Logger;
// import sv.edu.ues.occ.ingenieria.prn335.parqueo.parqueowebapp.app.control.AreaBean;
// import sv.edu.ues.occ.ingenieria.prn335.parqueo.parqueowebapp.app.entity.Area;
// import jakarta.json.Json;
// import jakarta.json.JsonArray;
// import jakarta.json.JsonObject;

// /**
//  *
//  * @author morax
//  */
// @Path("area")
// public class AreaResource implements Serializable {

//     @Inject
//     AreaBean aBean;

//     @GET
//     @Produces({MediaType.APPLICATION_JSON})
//     public List<Area> findRange(
//             @QueryParam(value = "first")
//             @DefaultValue(value = "0") int first,
//             @QueryParam(value = "page_size")
//             @DefaultValue(value = "50") int pagesize) {
//         return aBean.findRange(first, pagesize);
//     }

//     @GET
//     @Produces({MediaType.APPLICATION_JSON})
//     @Path("/{idArea}")
//     public Response findByIdArea(@PathParam(value = "idArea") final Integer idArea) {

//         if (idArea != null) {
//             Area encontrado = aBean.findById(idArea);
//             if (encontrado != null) {
//                 return Response.status(Response.Status.OK).entity(encontrado).build();

//             }
//             return Response.status(Response.Status.NOT_FOUND).header("not-found", idArea).build();
//         }
//         return Response.status(422).header("missing-parameter", "id").build();

//     }

//     @GET
//     @Produces({MediaType.APPLICATION_JSON})
//     @Path("/{idAreaPadre}/h")
//     public Response findAreasHijas(@PathParam(value = "idAreaPadre") final Integer idAreaPadre) {
//         if (idAreaPadre != null) {
//             Area resultado = aBean.findById(idAreaPadre);
//             if (resultado != null) {
//                 List<Area> respuesta = aBean.findByParentId(idAreaPadre);
//                 return Response.status(Response.Status.OK).entity(respuesta).build();
//             }
//             return Response.status(Response.Status.NOT_FOUND).header("not-found", idAreaPadre).build();
//         }
//         return Response.status(422).header("missing-parameter", "idAreaPadre").build();

//     }

//     @GET
//     @Produces({MediaType.APPLICATION_JSON})
//     @Path("list_areas_padres")
//     public Response findAreasPadres() {
//         List<Area> listAreasAll = aBean.findRange(0, 100);
//         if (listAreasAll != null) {
//             JsonArray value = Json.createArrayBuilder().build();
//             JsonObject js = Json.createObjectBuilder().build();
//             for (Area areaPadre : listAreasAll) {
// //                js.put,Json.createValue(areaPadre.getIdArea()).asJsonObject());
//                 value.add(Json.createObjectBuilder().add("idAreaPadre", areaPadre.getIdArea()).build());
//                 if (areaPadre.getIdAreaPadre() == null) {
//                     //listRaiz.add(areaPadre);
//                     for (Area areaHijas : areaPadre.getAreaList()) {
// //                        js.put("idAreaHijas", Json.createValue(areaHijas.getIdArea()));

//                         for (Area areaSubHijas : areaHijas.getAreaList()) {
// //                            js.put("idAreaSubHijas", Json.createValue(areaSubHijas.getIdArea()));

//                         }
//                     }
//                 }
//             }
//             return Response.status(200).entity(js).build();
//         }
//         return Response.status(404).build();
//     }

// //    public String listarAreas(List<Area> areas) {
// //        for (Area area : areas) {
// //            listarAreas(area, 0);
// //        }
// //        Gson gson = new Gson();
// //        return gson.toJson(areas);
// //    }
// //    List<Area> areas = new ArrayList();
// //
// //    public void listarAreas(Area area, int nivel) {
// //
// //        if (area.getIdAreaPadre() == null) {
// ////        for (int i = 0; i < nivel; i++) {
// ////          //  System.out.print(" ");
// ////          // 
// ////        }
// //            areas.add(area);
// //            for (Area hija : area.getAreaList()) {
// //                listarAreas(hija, nivel + 1);
// //            }
// //        }
// //    }
//     @POST
//     @Produces({MediaType.APPLICATION_JSON})
//     @Consumes({MediaType.APPLICATION_JSON})
//     public Response create(Area registro,
//             @Context UriInfo info) {

//         if (registro != null) {
//             try {
//                 aBean.create(registro);
//                 URI requestUri = info.getRequestUri();
//                 return Response.status(Response.Status.CREATED).header("location", requestUri.toString() + "/" + registro.getIdArea()).build();
//             } catch (Exception ex) {
//                 Logger.getLogger(getClass().getName()).log(Level.SEVERE, ex.getMessage(), ex);
//             }
//             return Response.status(500).header("create-exception", registro.toString()).build();
//         }
//         return Response.status(422).header("missing-parameter", "idArea").build();
//     }

//     @PUT
//     @Path("/{id}")
//     @Produces({MediaType.APPLICATION_JSON})
//     @Consumes({MediaType.APPLICATION_JSON})
//     public Response modify(
//             @PathParam(value = "id") final Integer idArea,
//             Area areaModificada) {
//         if (idArea != null && areaModificada != null) {
//             Area areaActual = aBean.findById(idArea);
//             if (areaActual != null) {
//                 try {

//                     if (areaModificada.getNombre() != null) {
//                         areaActual.setNombre(areaModificada.getNombre());
//                     }
//                     if (areaModificada.getIdAreaPadre() != null) {
//                         areaActual.setIdAreaPadre(areaModificada.getIdAreaPadre());
//                     }
//                     if (areaModificada.getDescripcion() != null) {
//                         areaActual.setDescripcion(areaModificada.getDescripcion());
//                     }

//                     aBean.modify(areaActual);
//                     return Response.status(Response.Status.OK)
//                             .entity("Area modificada exitosamente")
//                             .build();
//                 } catch (Exception ex) {
//                     Logger.getLogger(getClass().getName()).log(Level.SEVERE, ex.getMessage(), ex);
//                     return Response.status(500)
//                             .header("modify-exception", ex.getMessage())
//                             .build();
//                 }
//             } else {
//                 return Response.status(Response.Status.NOT_FOUND)
//                         .header("not-found", idArea)
//                         .entity("Area no encontrada")
//                         .build();
//             }
//         } else {
//             return Response.status(422)
//                     .header("missing-parameter", "id o AreaModificada")
//                     .entity("Parámetros 'id' y 'AreaModificada' son requeridos")
//                     .build();
//         }
//     }

//     @DELETE
//     @Path("/{id}")
//     @Produces({MediaType.APPLICATION_JSON})
//     public Response delete(
//             @PathParam(value = "id") final Integer idArea) {
//         if (idArea != null) {
//             Area Area = aBean.findById(idArea);
//             if (Area != null) {
//                 try {
//                     aBean.delete(Area);
//                     return Response.status(Response.Status.OK)
//                             .entity("Area eliminado exitosamente")
//                             .build();
//                 } catch (Exception ex) {
//                     Logger.getLogger(getClass().getName()).log(Level.SEVERE, ex.getMessage(), ex);
//                     return Response.status(500)
//                             .header("delete-exception", ex.getMessage())
//                             .build();
//                 }
//             } else {
//                 return Response.status(Response.Status.NOT_FOUND)
//                         .header("not-found", idArea)
//                         .entity("Area no encontrado")
//                         .build();
//             }
//         } else {
//             return Response.status(422)
//                     .header("missing-parameter", "id")
//                     .entity("Parámetro 'id' es requerido")
//                     .build();
//         }
//     }

// }
