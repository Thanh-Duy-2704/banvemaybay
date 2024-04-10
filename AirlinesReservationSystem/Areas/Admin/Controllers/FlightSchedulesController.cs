using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using AirlinesReservationSystem.Models;
using AirlinesReservationSystem.Helper;

namespace AirlinesReservationSystem.Areas.Admin.Controllers
{
    public class FlightSchedulesController : Controller
    {
        private Model1 db = new Model1();

        //Hàm này trả về một View chứa danh sách tất cả các lịch trình chuyến bay hiện có trong cơ sở dữ liệu. Nó bao gồm thông tin về sân bay xuất phát, sân bay đích và máy bay dùng trong mỗi lịch trình chuyến bay.
        // GET: Admin/FlightSchedules
        public ActionResult Index()
        {
            var flightSchedules = db.FlightSchedules.Include(f => f.AirPort).Include(f => f.AirPort1).Include(f => f.Plane);
            return View(flightSchedules.ToList());
        }
        //Hàm này trả về thông tin chi tiết của một lịch trình chuyến bay dựa trên ID của lịch trình. Nếu không tìm thấy lịch trình chuyến bay với ID được cung cấp, nó trả về mã lỗi 404 (Not Found).
        // GET: Admin/FlightSchedules/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            FlightSchedule flightSchedule = db.FlightSchedules.Find(id);
            if (flightSchedule == null)
            {
                return HttpNotFound();
            }
            return View(flightSchedule);
        }
        //Hàm này trả về một View cho phép người dùng tạo mới một lịch trình chuyến bay.
        // GET: Admin/FlightSchedules/Create
        public ActionResult Create()
        {
            ViewBag.from_airport = new SelectList(db.AirPorts, "id", "name");
            ViewBag.to_airport = new SelectList(db.AirPorts, "id", "name");
            ViewBag.plane_id = new SelectList(db.Planes, "id", "name");
            return View();
        }
        //Hàm này xử lý yêu cầu tạo mới một lịch trình chuyến bay. Nó kiểm tra tính hợp lệ của dữ liệu được gửi từ biểu mẫu và sau đó thêm lịch trình chuyến bay mới vào cơ sở dữ liệu nếu dữ liệu hợp lệ.
        // POST: Admin/FlightSchedules/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id,plane_id,code,from_airport,to_airport,departures_at,arrivals_at,cost")] FlightSchedule flightSchedule)
        {
            if (ModelState.IsValid)
            {
                db.FlightSchedules.Add(flightSchedule);
                db.SaveChanges();
                AlertHelper.setAlert("success", "Tạo dữ liệu chuyến bay thành công.");
                return RedirectToAction("Index");
            }

            ViewBag.from_airport = new SelectList(db.AirPorts, "id", "name", flightSchedule.from_airport);
            ViewBag.to_airport = new SelectList(db.AirPorts, "id", "name", flightSchedule.to_airport);
            ViewBag.plane_id = new SelectList(db.Planes, "id", "name", flightSchedule.plane_id);
            return View(flightSchedule);
        }
        //Hàm này trả về một View cho phép người dùng chỉnh sửa thông tin của một lịch trình chuyến bay dựa trên ID của lịch trình.
        // GET: Admin/FlightSchedules/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            FlightSchedule flightSchedule = db.FlightSchedules.Find(id);
            if (flightSchedule == null)
            {
                return HttpNotFound();
            }
            ViewBag.from_airport = new SelectList(db.AirPorts, "id", "name", flightSchedule.from_airport);
            ViewBag.to_airport = new SelectList(db.AirPorts, "id", "name", flightSchedule.to_airport);
            ViewBag.plane_id = new SelectList(db.Planes, "id", "name", flightSchedule.plane_id);
            return View(flightSchedule);
        }
        //Hàm này xử lý yêu cầu chỉnh sửa thông tin của một lịch trình chuyến bay. Nó kiểm tra tính hợp lệ của dữ liệu được gửi từ biểu mẫu và sau đó cập nhật thông tin của lịch trình chuyến bay trong cơ sở dữ liệu nếu dữ liệu hợp lệ.
        // POST: Admin/FlightSchedules/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,plane_id,from_airport,to_airport,departures_at,arrivals_at,cost")] FlightSchedule flightSchedule)
        {
            if (ModelState.IsValid)
            {
                db.Entry(flightSchedule).State = EntityState.Modified;
                db.SaveChanges();
                AlertHelper.setAlert("success", "Cập nhập thông tin chuyến bay thành công.");
                return RedirectToAction("Index");
            }
            ViewBag.from_airport = new SelectList(db.AirPorts, "id", "name", flightSchedule.from_airport);
            ViewBag.to_airport = new SelectList(db.AirPorts, "id", "name", flightSchedule.to_airport);
            ViewBag.plane_id = new SelectList(db.Planes, "id", "name", flightSchedule.plane_id);
            return View(flightSchedule);
        }
        //Hàm này xử lý yêu cầu xóa một lịch trình chuyến bay khỏi cơ sở dữ liệu dựa trên ID của lịch trình được xác nhận. Nó xóa lịch trình chuyến bay khỏi cơ sở dữ liệu và chuyển hướng đến trang danh sách lịch trình chuyến bay.
        // GET: Admin/FlightSchedules/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            FlightSchedule flightSchedule = db.FlightSchedules.Find(id);
            db.FlightSchedules.Remove(flightSchedule);
            AlertHelper.setAlert("success", "Xóa dữ liệu chuyến bay thành công.");
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
