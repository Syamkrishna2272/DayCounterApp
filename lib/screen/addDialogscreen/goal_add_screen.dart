import 'package:day_counter/function/date_time_adding.dart';
import 'package:flutter/material.dart';

class GoalAdding extends StatelessWidget {
  const GoalAdding({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController tittlecontroller = TextEditingController();
    TextEditingController daycontroller = TextEditingController();
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(MediaQuery.sizeOf(context).width / 25),
      ),
      backgroundColor: const Color(0xFF34343E),
      child: Container(
        padding: EdgeInsets.all(MediaQuery.sizeOf(context).width / 20),
        width: MediaQuery.sizeOf(context).width * 0.8,
        height: MediaQuery.sizeOf(context).height * 0.6,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    "Create your Goal",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: MediaQuery.sizeOf(context).width / 20,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
            const Text(
              "Create Your Countdown Timer. Start tracking your",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            const Expanded(
              child: Text(
                "journey to success today!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height / 25),
            const Text(
              "Title*",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height / 15,
              child: TextField(
                controller: tittlecontroller,
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(
                  hintText: "Enter title (Mandatory)",
                  hintStyle: const TextStyle(color: Color(0xFFB0B0B0)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                        MediaQuery.sizeOf(context).width / 30),
                  ),
                  fillColor: const Color(0xFF121212),
                  filled: true,
                ),
                style: TextStyle(
                    fontSize: MediaQuery.sizeOf(context).height / 50,
                    color: Colors.white),
                cursorColor: Colors.white,
              ),
            ),
            SizedBox(height: MediaQuery.sizeOf(context).width / 30),
            const Text(
              "Number of Days*",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: MediaQuery.sizeOf(context).height / 15,
                  width: MediaQuery.sizeOf(context).width / 3,
                  child: TextField(
                    controller: daycontroller,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: "Days (Mandatory)",
                      hintStyle: const TextStyle(color: Color(0xFFB0B0B0)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                            MediaQuery.sizeOf(context).width / 30),
                      ),
                      fillColor: const Color(0xFF121212),
                      filled: true,
                    ),
                    style: TextStyle(
                        fontSize: MediaQuery.sizeOf(context).height / 60,
                        color: Colors.white),
                    cursorColor: Colors.white,
                  ),
                ),
                Container(
                  height: MediaQuery.sizeOf(context).height / 16,
                  width: MediaQuery.sizeOf(context).width / 3,
                  decoration: BoxDecoration(
                    color: const Color(0xFF121212),
                    borderRadius: BorderRadius.circular(
                        MediaQuery.sizeOf(context).width / 30),
                  ),
                  child: const Center(
                    child: Text(
                      "DAYS",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                startcount(
                    tittlecontroller: tittlecontroller,
                    daycontroller: daycontroller,
                    context: context);
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.sizeOf(context).height / 50),
                backgroundColor: const Color(0xFF2C69DE),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      MediaQuery.sizeOf(context).width / 30),
                ),
              ),
              child: const Text(
                "Start Countdown",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
