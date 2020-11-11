//
//  OrderResume.swift
//  OrandaStore
//
//  Created by Emilio Castro on 11/10/20.
//  Copyright © 2020 Emilio Castro. All rights reserved.
//

import SwiftUI

struct OrderResume: View {
    var body: some View {
        
        ZStack {
            Color("bg").ignoresSafeArea(.all, edges: .all)
        VStack{
     //       List {
            ScrollView(.vertical, showsIndicators: false) {
                ForEach(dataPedidos, id: \.self	){order in
                        
                    ZStack{
                        Rectangle().fill(Color("CajaFondo"))
                            .cornerRadius(10)
                            .shadow(color: Color.orange, radius: 10, x: 0, y: 1)
                        VStack{
                        HStack{
                            //    Image(systemName: "magnifyingglass.circle")
                              //      .font(.largeTitle)
                            
                            Text(order.name).bold().padding(8)
                                .foregroundColor(.white)
                                .background(order.name == "Procesando" ? Color.orange : order.name == "Entregado" ? Color.green : Color.red)
                                .cornerRadius(8)
                            
                            Spacer()
                            Text("# \(order.id_order)")
                                .padding()
                                .font(.title2)
                            Image(systemName: order.name == "Rechazado" ?  "xmark.octagon.fill" : order.name == "Procesando" ? "hourglass.tophalf.fill" : "checkmark.seal.fill")
                                .foregroundColor(order.name == "Procesando" ? Color.orange : order.name == "Entregado" ? Color.green : Color.red)
                            
                           
                        }.padding(.top,10)
                        .padding(.horizontal,10)
                      
                          
                            VStack(alignment: .leading, spacing: 3){
                                Text("Puesto en : \(order.date_add)")
                                    .font(.caption)
                                
                                Text("Pagado por : \(order.payment)")
                                    .font(.caption)
                                
                                Text("Total : \(order.symbol) \(order.total_paid)")
                                    .font(.subheadline)
                            }.padding(.bottom,10)
                        }
                       
                    }
                    
                }//ForEach
                }//List
            }//VStack
        }//ZStack
        }//bodyView
    
}

struct OrderResume_Previews: PreviewProvider {
    static var previews: some View {
        OrderResume()
    }
}

 let dataPedidos = [Pedidos(id_order: "123", reference: "ABCD123", name: "Procesando", date_add: "2020-10-17 21:10:43", payment: "Pagos por transferencia bancaria", entrega: "CASA", dir_entrega: "Ciudad de mi trabajo", dir_entrega2: "direccion complementaria", facturacion: "CASA", dir_facturacion: "Ciudad de mi trabajo", dir_facturacion2: "direccion complementaria", symbol: "Q", total_paid: "50.00", invoice_number: "0"),Pedidos(id_order: "1352", reference: "ABCD123", name: "Entregado", date_add: "2020-10-17 21:10:43", payment: "Pagos por transferencia bancaria", entrega: "CASA", dir_entrega: "Ciudad de mi trabajo", dir_entrega2: "direccion complementaria", facturacion: "CASA", dir_facturacion: "Ciudad de mi trabajo", dir_facturacion2: "direccion complementaria", symbol: "Q", total_paid: "150.00", invoice_number: "0"),Pedidos(id_order: "1212", reference: "ABCD123", name: "Rechazado", date_add: "2020-10-17 21:10:43", payment: "Pagos por transferencia bancaria", entrega: "CASA", dir_entrega: "Ciudad de mi trabajo", dir_entrega2: "direccion complementaria", facturacion: "CASA", dir_facturacion: "Ciudad de mi trabajo", dir_facturacion2: "direccion complementaria", symbol: "Q", total_paid: "200.00", invoice_number: "0")]
