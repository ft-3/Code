#[derive(Debug)]
struct Location {
    x: i32,
    y: i32
}

fn main() {
    
    let input = "RDRRDLRRUDRUUUULDDRDUULLDUULDURDDUDRULDLUDDRLRDUDDURRRRURDURLLRDRUUULDLLLURDRLLULLUULULLLDLLLRRURRLRDUULRURRUDRRDRLURLRURLLULRUURRUURDDLDRDLDLLUDUULLLUUUUDULLDRRUURLDURDDDDDRLLRRURDLUDRRUUDLRRLLRDURDUDDDLRDDRDLRULLUULRULRLLULDDRURUUDLDDULDRLLURDDUDDUDRDUDLDRRRDURRLDRDRLDLLDUDDDULULRRULRLLURDRRDDUUUUUULRUDLRRDURDLRDLUDLDURUDDUUURUDLUUULDLRDURDLDUUDLDDDURUUDUUDRLRDULLDUULUDRUDRLRRRDLLDRUDULRRUDDURLDRURRLLRRRDRLLDLULULRRUURRURLLUDRRLRULURLDDDDDURUDRRRRULLUUDLDDLUUL
    ULURUDLULDULDLLDDLLLDRRLLUDRRDRDUDURUDLRRRRUDRDDURLRRULLDLURLDULLUDDLUDURDUURRRRLDLRLDDULLRURLULLDDRUDLRRRLDRRRDLDRLLDDRRDDLUUDRUDDLULRURLDURRLLDLRUDLLRRUULUDRLLLRLDULURRRRRDDUURDRRUUDULRUULDDULRLUDLUDDULLRLRDDLRLLURRRULDLRRRUURRLDDRDLRDLRRDRDLDRDUDRDURUUDRLRRULRDLLDLLRRRDRLDRLRLRLLLURURDULUUDDRLLDDDRURRURLRDDULLRURUDRRDRLRRRLDLRLRULDRLUURRUUULRLDLLURLLLDLLLDRRDULRURRRRLUDLLRRUDLRUDRURDRRDLUUURRDLRLRUUUDURDLUDURRUUDURLUDDDULLDRDLLDDDRLDDDRLDLDDDDUDUUDURUUDULRDDLULDRDRLURLUDRDLUULLULRLULRDDRULDUDDURUURULUDLUURLURU
    URLURDDRLLURRRLDLDLUDUURDRUDLLLRRDLUUULRRLURRRLUDUDLRLDDRUDLRRRULUDUDLLLULULLLRUDULDDDLLLRRRLRURDULUDDDULDLULURRRDLURDLRLLDUDRUDURDRRURULDRDUDLLRDDDUDDURLUULLULRDRRLDDLDURLRRRLDRDLDULRULRRRLRLLDULRDLURLRUUDURRUUDLLUDRUDLRLDUUDLURRRDDUUDUDRLDLDDRURDDLLDDRDLRLRDLLLUDLUUDRLRLRDDRDLRDLLUULLLLUULLDLLDLRDLRLRRLUUDLLRLRUDRURULRLRLULUDRLLUDDUDDULRLDDRUUUURULDRRULLLDUURULUDRLLURLRRLDLRRLDDRRRDUDDUDLDDLULUDDUURDLLLRLDLRDRUUUUUDDDLDRDDRRRLRURRRRDURDRURUDLURRURDRLRUUDDLDRRULLDURDRLRRDURURUULRDUDLDRDDLULULRDRRUDDRLLRLULRLLUUDRDUUDDUDLRUUDLLUULLRUULUDDLURRRLLDRLRRLLRULLDUULURLLLLUUULDR
    LDUURULLRLDRRUUDUUUURUUUDDDURRDDLRDLLRDDRULDDUURUDDURLLUDRDUDRDULDRRRLULUDRULLLLDRLLDRDLDLLRURULUDDDDURDDDRLLUDLDRULRDLDUDDDUUDLLRLLLDLRLRLRRUDDULDDDUDLDDLUDDULDLLLLULLLLDDURDDURRRDDRLRLLUDLLUDDDUDURUDRLRDRULULDDRULDLULULLRUULRLDULUURRDRDRRDLDDDRRLUULDLUDRDDUDLRURULLDDURLDDRULUDLDDDRDRLLRDLLUURRRURDRLRURLDDLURDRURDDURLLRLRUDUUDLDUDURRDDURDRDDUDDDUDUURURDDLLRUUDDRRDULDDLLDLRULUULRUUDLLDRLULDULDDUDLULRULDRLLDUULDDDLRLLRLULDDULDDRRRLDRRLURULRDDRDLRRDUDDRDRRRRUDUDLLRRDRRURRUURDRULDDUDURLUDDURDUDRDUULLDRURUURURDRRLDDLDLUURLULRUDURDRUUURRURRDRUDRUURDURLRULULLLULDLLDLRRLDRDLUULUDDDLRDRLRLDRUDUDRLLRL
    LURLUURLURDUUDRUDLDLLURRRDLDRRRULDDRRDRDUUDRUDURDDDURLUDDLULUULRRLLRULUDRDDRRRLDURDUDDURDDDLRLDDLULLDRDDLUUDUURRRLULRUURRRRLLULDUDRDUURRRURRDRDUDUDLUDULLDLDDRLUDRURDULURLURRLLURLLLRLUURLRUDLUDDRLURRUULULRLURRURUDURDLDLDDUDDRDLLRLLRRULDDRUDURUDDDUDLLRDLRUDULLLRRRUURUDUUULLRDUDRURUDULLDLLUUUDRULRLLRRDDDDUDULDRDRLLDDLLDDDURRUDURLDLRDRUURDDURLRDRURLRRLLRLULDRRLRUDURDUURRLUUULUDDDLRLULRDRLLURRRDLURDUUDRRRLUURRLLUDLUDLUULLRRDLLRDDRURRUURLDDLRLRLRUDLDLRLRDRRDLLLRDLRDUDLLDDDRD".to_string();

    let mut place_on_keypad = Location { x: 0, y: 2 };

    let lines: Vec<&str> = input.split("\n").clone().collect();

    for line in lines {
        line.trim();
        for chr in line.chars() {
            match (chr, place_on_keypad.x) {
                ('U', x) if (x == 0 || x == 4) => place_on_keypad.y = 2,
                ('U', x) if ((x == 1 || x == 3) && place_on_keypad.y < 2) => place_on_keypad.y += 1,
                ('U', x) if (x == 2 && place_on_keypad.y < 4) =>  place_on_keypad.y += 1,

                ('D', x) if (x == 0 || x == 4) => place_on_keypad.y = 2,
                ('D', x) if ((x == 1 || x == 3) && place_on_keypad.y > 1) => place_on_keypad.y -= 1,
                ('D', x) if (x == 2 && place_on_keypad.y > 0) =>  place_on_keypad.y -= 1,
               
                _ => {}
            }

            match (chr, place_on_keypad.y) {
                ('R', y) if (y == 0 || y == 4) => place_on_keypad.x = 2,
                ('R', y) if ((y == 1 || y == 3) && place_on_keypad.x < 2) => place_on_keypad.x += 1,
                ('R', y) if (y == 2 && place_on_keypad.x < 4) => place_on_keypad.x += 1,

                ('L', y) if (y == 0 || y == 4) => place_on_keypad.x = 2,
                ('L', y) if ((y == 1 || y == 3) && place_on_keypad.x > 1) => place_on_keypad.x -= 1,
                ('L', y) if (y == 2 && place_on_keypad.x > 0) => place_on_keypad.x -= 1,
                
                _ => {}
            }
        }
        println!("{:?}", place_on_keypad);
    }
}

/*
Location { x: 0, y: 2 } = 1
Location { x: 1, y: 2 } = 2
Location { x: 1, y: 1 } = 5
Location { x: 0, y: 0 } = 7
Location { x: 1, y: 0 } = 8

    1
  2 3 4
5 6 7 8 9
  A B C
    D

Location { x: 2, y: 2 } = 7
Location { x: 2, y: 4 } = 1
Location { x: 4, y: 2 } = 9
Location { x: 2, y: 0 } = D
Location { x: 2, y: 0 } = D

Location { x: 0, y: 2 } = 5
Location { x: 2, y: 4 } = 1
Location { x: 1, y: 2 } = 6
Location { x: 2, y: 0 } = D
Location { x: 2, y: 0 } = D
    */
