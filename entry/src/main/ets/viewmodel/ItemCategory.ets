// 记录项类型
 export default class ItemCategory {
   // 类型ID
   id: number
   // 类型名称
   name: ResourceStr

   constructor(id: number,name: ResourceStr) {
     this.id = id
     this.name = name
   }
 }