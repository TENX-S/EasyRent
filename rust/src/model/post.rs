#[derive(Debug)]
struct Post {
    id: i64,
    publisher: String,
    province: String,
    city: String,
    description: String,
    background_path: Vec<String>,
    monthly_rent: u32,
    payment_restrictions: String,
    room_type: String,
    room_area: u32,
    room_floor: u8,
    orientation: String,
}
